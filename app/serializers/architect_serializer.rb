class ArchitectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :prev, :next
end
