module Admin::StrategicObjectivesHelper
  def nested_strategic_objectives(strategic_objectives)
    strategic_objectives.map do |strategic_objective, sub_strategic_objective|
        (render 'strategic_objective', strategic_objective: strategic_objective) + 
          content_tag(:div, nested_strategic_objectives(sub_strategic_objective), class: 'nested_strategic_objective', id: "sub-#{strategic_objective.id}")
    end.join.html_safe
  end
  
  def news_for_objectives(strategic_objective, message = 'Click Para Editar')
    strategic_objective.papers.empty? ?  message :  strategic_objective.papers.map(&:title).join(',')
  end
  
  def admin_nested_annotations(annotations, strategic_objective)
    annotations.map do |annotation, sub_annotations|
      (render 'annotations/annotation', {strategic_objective: strategic_objective, annotation: annotation}) + 
        content_tag(:div, admin_nested_annotations(sub_annotations, strategic_objective), class: 'nested_admin_annotations')
    end.join.html_safe
  end
end
