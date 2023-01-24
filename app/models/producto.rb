class Producto < ApplicationRecord
    has_many :detalle_ordenes
    has_many :ordenes, through: :detalle_ordenes
end
