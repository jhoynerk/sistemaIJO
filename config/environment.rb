# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
require 'date'

Date::MONTHNAMES      = [nil] + %w( Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre )
Date::DAYNAMES        = %w( Lunes Martes Miércoles Jueves Viernes Sábado Domingo )
Date::ABBR_MONTHNAMES = [nil] + %w( Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic )
Date::ABBR_DAYNAMES   = %w( Lun Mar Mié Jue Vie Sáb Dom )
