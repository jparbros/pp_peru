module Admin::StrategicObjectivesHelper
  def nested_strategic_objectives(strategic_objectives)
    strategic_objectives.map do |strategic_objective, sub_strategic_objective|
        (render 'strategic_objective', strategic_objective: strategic_objective) + 
          content_tag(:div, nested_strategic_objectives(sub_strategic_objective), class: 'nested_strategic_objective', id: "sub-#{strategic_objective.id}")
    end.join.html_safe
  end
  
  def news_for_objectives(strategic_objective)
    strategic_objective.papers.empty? ?  'Click Para Editar' :  strategic_objective.papers.map(&:title).join(',')
  end
end
