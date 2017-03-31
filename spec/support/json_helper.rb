module JsonHelper
  def compare_response_body_with_model(response, model)
    model_json = JSON.parse(ActiveModelSerializers::SerializableResource.new(model).to_json, {symbolize_names: :true})
    body_json = JSON.parse(response.body, {symbolize_names: :true})
    expect(body_json).to eq(model_json)
  end
end


RSpec.configure do |c|
  c.include JsonHelper
end
