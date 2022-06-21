class Watch::Model < ApplicationRecord
  belongs_to :family, class_name: 'Watch::Family', foreign_key: 'watch_family_id'

  def assign_by_api(data)
    self.name = data['watchName']
    self.market_price = data['marketPriceEuro']
    self.limited = data['limited']
    self.case = {
      material: data['caseMaterial'],
      glass: data['caseGlass'],
      back: data['caseBack'],
      shape: data['caseShape'],
      diameter: data['caseDiameter'],
      height: data['caseHeight'],
      lug_width: data['caseLugWidth'],
      wr: data['caseWr']
    }
    self.dial = {
      color: data['dialColor'],
      indexes: data['dialIndexes'],
      hands: data['dialHands']
    }
    self.movement = {
      acoustic: data['movementAcoustic'],
      brand: data['movementBrand'],
      caliber: data['movementCaliber'],
      chronograph: data['movementChronograph'],
      date: data['movementDate'],
      diameter: data['movementDiameter'],
      display: data['movementDisplay'],
      frequency: data['movementFrequency'],
      jewels: data['movementJewels'],
      reserve: data['movementReserve'],
      time: data['movementTime'],
      type: data['movementType']
    }
  end
end
