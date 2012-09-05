module DiscussionsHelper

  def class_by_annotation(annotation)
    case annotation.status
      when 'reported_by_admin', 'third_report' then 'hidden'
      else ''
    end
  end
end