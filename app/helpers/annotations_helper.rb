module AnnotationsHelper
  def get_annotable_path(annotable)
    case annotable
      when Discussion then debate_comentarios_path(annotable)
      when News then noticia_comentarios_path(annotable)
      when Proposal then propuesta_comentarios_path(annotable)
    end
  end
  
  def nested_annotations(annotations)
    annotations.map do |annotation, sub_annotation|
        (render 'annotation', annotation: annotation) + content_tag(:div, nested_annotations(sub_annotation), class: 'nested_annotations')
    end.join.html_safe
  end
end
