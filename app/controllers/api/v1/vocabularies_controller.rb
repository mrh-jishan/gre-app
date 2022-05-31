class Api::V1::VocabulariesController < Api::ApiController
  before_action :authorize_request

  def index
    @vocabularies = Vocabulary.all
    json_response(@vocabularies, 200)
  end

end
