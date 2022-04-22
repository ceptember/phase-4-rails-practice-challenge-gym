class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_amount

  def total_amount
     charges = self.object.memberships.map { |m| m.charge }
     charges.reduce { |a,b| a + b} 

  end
end
