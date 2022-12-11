-- Consulta 1: 
select m.id_modelo, md.modelos, mr.nombre as marca, ge.nombre as grupo,v.fecha_compra, v.matricula,v.id_color, v.km_total,v.id_aseguradora, v.id_poliza
from paola_villalba_practica.modelo as m
full outer join paola_villalba_practica.modelos md
on m.id_modelos = md.id_modelos 
full outer join paola_villalba_practica.marca mr 
on mr.id_marca = m.id_marca 
full outer join paola_villalba_practica.grupo_empresarial ge 
on ge.id_grupo = m.id_grupo 
full outer join paola_villalba_practica.vehiculos v 
on v.id_vehiculo  = m.id_modelo 
order by m.id_modelo asc 









