json.extract! influencer, :id, :name, :image, :bio, :created_at, :updated_at
json.url influencer_url(influencer, format: :json)
