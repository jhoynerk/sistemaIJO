json.array!(@beneficiaries) do |beneficiary|
  json.extract! beneficiary, :id, :first_name, :last_name, :email, :position, :phone
  json.url beneficiary_url(beneficiary, format: :json)
end
