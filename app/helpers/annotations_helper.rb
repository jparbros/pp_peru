module AnnotationsHelper
  def get_annotable_path(annotable)
    if annotable.kind_of? Discussion
      debate_comentarios_path(annotable)
    elsif annotable.kind_of? News
      noticias_comentarios_path(annotable)
    end
  end
  
  def nested_annotations(annotations)
    annotations.map do |annotation, sub_annotation|
      (render partial: 'annotation', locals: {annotation: annotation}) + 
        content_tag(:div, nested_annotations(sub_annotation), :class => "nested_annotations")
    end.join.html_safe
  end
end
