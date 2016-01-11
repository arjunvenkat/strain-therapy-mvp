require 'test_helper'

class ScientificEvidencesControllerTest < ActionController::TestCase
  setup do
    @scientific_evidence = scientific_evidences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scientific_evidences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scientific_evidence" do
    assert_difference('ScientificEvidence.count') do
      post :create, scientific_evidence: { ailment_id: @scientific_evidence.ailment_id, comment: @scientific_evidence.comment, description: @scientific_evidence.description, featured: @scientific_evidence.featured, link: @scientific_evidence.link }
    end

    assert_redirected_to scientific_evidence_path(assigns(:scientific_evidence))
  end

  test "should show scientific_evidence" do
    get :show, id: @scientific_evidence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scientific_evidence
    assert_response :success
  end

  test "should update scientific_evidence" do
    patch :update, id: @scientific_evidence, scientific_evidence: { ailment_id: @scientific_evidence.ailment_id, comment: @scientific_evidence.comment, description: @scientific_evidence.description, featured: @scientific_evidence.featured, link: @scientific_evidence.link }
    assert_redirected_to scientific_evidence_path(assigns(:scientific_evidence))
  end

  test "should destroy scientific_evidence" do
    assert_difference('ScientificEvidence.count', -1) do
      delete :destroy, id: @scientific_evidence
    end

    assert_redirected_to scientific_evidences_path
  end
end
