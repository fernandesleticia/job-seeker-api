class VacancySerializer < ActiveModel::Serializer
  attributes :id, :partnerId, :title, :categoryId, :expiresAt, :status
end
