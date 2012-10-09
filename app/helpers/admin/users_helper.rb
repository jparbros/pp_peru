module Admin::UsersHelper
  def section_by_class(section)
    case section
    when 'Discussion' then 'Centro de Debate'
    when 'Entry' then 'Centro Educacional'
    when 'News' then 'Centro de Medios | Noticas'
    when 'Proposal' then 'Propuesta Ciudadana'
    when 'User' then 'Usuarios'
    when 'Group' then 'Grupos'
    when 'NewsActor' then 'Centro de Medios | Actores'
    when 'StrategicObjective' then 'Objetivos Estrategicos'
    end
  end
end
