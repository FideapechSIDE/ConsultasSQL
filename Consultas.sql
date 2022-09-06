
--SQL de Datos Generales
--Ordenados por NoControl, Domicilio, Teléfono, Colonia, Municipio, Giro, CP, Actividad Clave, Observación, Actividad, TipoNegocio, Fecha de Inicio de Operación,
--Empleos Generados, Productos o Servicios e Ingresos
SELECT
    cc.nocontrolcli,
    n.domicilio,
    n.telefono,
    col.Colonia,
    m.Municipio,
    g.Descripcion AS Giro,
    n.idactividad,
    n.cp,
    n.Noext,
    n.NoInt,
    n.Ubicacion,
    acc.Descripcion AS ActividadClave,
    n.Observaciones,
    n.Coordenadas,
    ac.Descripcion AS actividad,
    tpa.TipoActividad AS TipoNegocio,
    n.InicioOperacion,
    n.TiempoOperacion,
    tvi.TipoVivienda AS TipoPropiedad,
    n.SuperficieLocal,
    n.ArrDom AS Arraigo,
    n.ValorLocal AS ValorORenta,
    n.OtroPrograma,
    n.Trabajadores,
    n.EmpleosAGenerar,
    n.Licencia,
    n.NoLicencia,
    n.Experiencia,
    n.ExperienciaEmp AS ExperienciaEmpresario,
    n.PerteneceAsociacion,
    n.ProductoServicios,
    n.IngresoMensual AS IngresoActual,
    n.IngresoGeneral AS IngresoAGenerar,
    n.PublicoGeneral,
    n.ClientesDetallistas,
    n.ClientesMayorista,
    n.ClientesEmpresa,
    n.PrincipalesClientes,
    n.VentaContado,
    n.VentaCredito,
    n.CondicionesComerciales,
    n.MercadoRegional,
    n.MercadoLocal,
    n.MercadoEstatal,
    n.MercadoNacional
FROM
    negocios AS n
    LEFT JOIN tiposvivienda AS tvi on tvi.IDTipoVivienda = n.TipoLocal
    LEFT JOIN colonias AS col on col.IDColonia = n.IDColonia
    LEFT JOIN actividades AS ac on ac.IDActividad = n.IDActividad
    LEFT JOIN actividades AS acc on acc.IDActividad = n.IDActividadClave
    LEFT JOIN municipios AS m on m.IDMunicipio = n.IDMunicipio
    LEFT JOIN tipoactividades AS tpa on tpa.IDTipoActividad = n.tipo
    LEFT JOIN giros AS g on g.IDGiro = n.IDGiro
    LEFT JOIN creditosclientes AS cc on cc.nosolicitud = n.nosolicitud
WHERE
    m.IDEstado = "CHU"
    and col.idestado = "CHU"
    and col.idmunicipio = m.IDMunicipio 
    
--Estados de Resultados
--Cuentas de estados de resultados ordenadas por numero de control
SELECT
    cc.NoControlCli,
    r.fecha,
    r.dias,
    r.VentasNetas,
    r.Mercancias,
    r.Empaques,
    r.Salarios,
    r.CostoVentas,
    r.UtilidadBruta,
    r.ComisionVentas,
    r.publicidad,
    r.Gasolina,
    r.GastosFamiliares,
    r.luz,
    r.Sueldos,
    r.otros,
    r.TotalAdministracion,
    r.UtilidadOperacion,
    r.GastosFinancieros,
    r.ProductosFinancieros,
    r.UtilidadesAntesImpuestos,
    r.Impuestos,
    r.ResultadoEjercicio,
    r.OtrosIngresosMensuales
FROM
    creditosclientes as cc
    left join resultados as r on cc.NoSolicitud = r.NoSolicitud
