require 'faraday'
require 'faraday/net_http'
require 'uri'
Faraday.default_adapter = :net_http

class WatchCrawler
  def self.call
    new.call
  end

  def call
    get_brands
  end

  def get_brands
    brands_response = conn.get('/all-brands')
    brands = JSON.parse(brands_response.body)

    brands.each do |brand|
      puts brand
      watch_brand = Watch::Brand.where(name: brand['brandName']).first_or_create
      get_families(watch_brand)
    end
  end

  def get_families(brand)
    puts 'family by brand'
    puts brand.name
    families_response = conn.get(URI.encode("/all-family-by/brandname/#{brand.name}"))
    families = JSON.parse(families_response.body)

    families.each do |family|
      puts family
      watch_family = Watch::Family.where(name: family['familyName'], brand: brand).first_or_create
      get_models(watch_family)
    end
  end

  def get_models(family)
    puts 'models by family'
    puts family.name
    models_response = conn.get(URI.encode("/all-models-by/brandname/#{family.brand.name}/family/#{family.name}"))
    models = JSON.parse(models_response.body)

    models.each do |model|
      get_model(family, model['modelName'])
    end
  end

  def get_model(family, model_name)
    puts 'model by model_name'
    puts model_name
    model_response = conn.get(URI.encode("/all-watches-by/brandname/#{family.brand.name}/family/#{family.name}/model/#{model_name}"))
    model = JSON.parse(model_response.body)

    model.each do |mdl|
      watch = Watch::Model.where(watch_id: mdl['id'], family: family).first_or_initialize
      watch.assign_by_api(mdl)
      watch.image_url = get_model_image(mdl['id'])
      watch.save
    end
  end

  def get_model_image(watch_id)
    image_response = conn.get(URI.encode("/watch-media-links-by-id/#{watch_id}"))
    image = JSON.parse(image_response.body)

    image.first
  end

  def conn
    Faraday.new(
      url: ENV['WATCH_API_BASE_URL'],
      headers: {
        "X-RapidAPI-Key": ENV['WATCH_API_KEY'],
        'X-RapidAPI-Host': ENV['WATCH_API_HOST']
      }
    )
  end
end