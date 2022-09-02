class EstadoVerificacion{}
class EventoVerificacion{}

//Estados

class Creandose extends EstadoVerificacion{}
class SolicitandoNombre extends EstadoVerificacion{}
class EsperandoNombre extends EstadoVerificacion{}
class EsperandoConfirmacionNombre extends EstadoVerificacion{}

//Eventos

class Creo extends EventoVerificacion{}
class NombreRecibido extends EventoVerificacion{}
class NombreNoConfirmado extends EventoVerificacion{}
class NombreConfirmado extends EventoVerificacion{}
