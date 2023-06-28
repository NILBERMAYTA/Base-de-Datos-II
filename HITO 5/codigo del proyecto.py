#LIBRERIAS PARA EL CHATBOT---------------------------------------------------------------------------------------------------
#pip install pytelegrambotapi
import telebot
from telebot import types
#pip install nltk
import nltk
#nltk.download('punkt')
from nltk.tokenize import word_tokenize



TELEGRAM_TOKEN = "6246154835:AAGQtKnQ1QUmYUClSWw-14cNkz-ZL6Ugjsc"
bot = telebot.TeleBot(TELEGRAM_TOKEN)


atencion = " Si tiene reclamos de algún producto y no lo hace de mala fe puede contactarse con el siguiente numero enviando un mensaje a al numero: ##########"
#AUDIFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------
inalambrico = {
    "AirPods Pro":
    {
        "nombre" : "AirPods Pro",
        "imagen" : "https://as-images.apple.com/is/MME73?wid=1000&hei=1000&fmt=jpeg&qlt=95&.v=1632861342000",
        "descripcion": 
            "Dimensiones: 30.9 x 21.8 x 24 mm (cada auricular) \n"
            "Peso: 5.4 gramos (cada auricular)\n"
            "Batería: hasta 4.5 horas de escucha con una sola carga, y hasta 24 horas de duración de la batería con el estuche de carga\n"
            "Tiempo de carga: 5 minutos de carga en el estuche proporcionan hasta 1 hora de escucha\n"
            "Resistencia al agua y al sudor: certificación IPX4\n"
            "Tecnología de cancelación activa de ruido: bloquea el ruido externo y ajusta el audio al ajuste personalizado del usuario\n"
            "Modo de sonido ambiente: permite al usuario escuchar el sonido externo mientras escucha música o podcasts\n"
            "Control táctil: permite al usuario controlar la música, las llamadas y el modo de sonido ambiente con un simple toque\n"
            "Micrófonos: dos micrófonos orientados hacia afuera para detectar el ruido externo, un micrófono orientado hacia adentro para detectar el sonido interno y un micrófono adicional para llamadas\n"
            "Compatibilidad: se conectan automáticamente a los dispositivos Apple y están disponibles en dispositivos con iOS 14.2 o posterior, iPadOS 14.2 o posterior, watchOS 7.1 o posterior, tvOS 14.2 o posterior y macOS Big Sur 11.0.1 o posterior.\n"
            "Precio 200 Bs\n"
    }
    ,"F9 True" :
    {
        "nombre" : "F9 True",
        "imagen" : "https://cdn1.smartprix.com/rx-i1xod6rKN-w1200-h1200/vehop-power-f9-true.webp",
        "descripcion": 
            "Marca: JSQUAR3D\n"
            "Color: Negro\n"
            "Factor de forma: In Ear\n"
            "Tecnología de conectividad: Wireless\n"
            "Tecnología de comunicación inalámbrica: Bluetooth\n"
    }
    ,"MI":
    {
        "nombre" : "MI",
        "imagen" : "https://m.media-amazon.com/images/I/412Os1k1MbL._AC_SX522_.jpg",
        "descripcion":    
            " Marca: Xiaomi\n"
            "Color: Negro\n"
            "Duración de batería: 4 horas de duración de la batería, 12 horas de resistencia\n"
            "Tipo de conector: Bluetooh\n"
            "Protección: IPX4 contra salpicaduras y sudo\n"
            "Funciones generales: Contestador, Cancelación de ruido, Cambio de canciones.\n"
            "Precio: 90Bs\n"
    }
}


cascos = {
            "PSS":
          {
                "nombre": "PSS",
                "imagen": "https://pssevolutionforever.life/web/image/product.product/2756/image_1024/%5BPSS-HB82-N%5D%20Audifono%20bluetooth%20PSS-HB82-N%20color%20negro%20-%20Audifonos?unique=bdd7acb",
                "descripcion":
                    "Tiempo de conversación: hasta 8 horas\n"
                    "Tiempo de música: hasta 8 horas\n"
                    "Tiempo de espera: hasta 120 horas\n"
                    "Material: aleación de aluminio + TPE + ABS\n"
                    "Compartible: PC/MP3/teléfono móvil/tableta/laptor\n"
                    "Peso:350g\n"
            },
          "JBL Tune 510BT":{
              "nombre": "JBL Tune 510BT",
              "imagen": "https://m.media-amazon.com/images/I/61yjoRgptdL._AC_SX466_.jpg",
              "descripcion":
                "Marca: JBL\n"
                "Bluetooth: 5.0\n"
                "Tiempo de carga: 2hr\n"
                "Tiempo de juego máximo: 40hr\n"
                "Respuesta de frecuencia dinámica: 20 Hz – 20 kHz\n"

          },
          "Philips TAH1205":{
              "nombre":"Philips TAH1205",
              "imagen":"https://coolboxpe.vtexassets.com/arquivos/ids/251233-800-auto?v=638103673775000000&width=800&height=auto&aspect=true",
              "descripcion":
                	"Tipo:On Ear\n"
                    "Micrófono:Sí\n"
                    "Conexión Bluetooth:Sí\n"
                    "Inalámbrico:Sí\n"
                    "Tiempo de reproducción:Hasta 15 horas\n"
                    "Controles:Música y llamadas\n"
                    "Tipo de batería: Litio-polímero\n"
                    "Impedancia (Ohmios): 32 Ohms\n"

          }
}
concable = {
    "JIB PILL":
    {
        "nombre": "JIB PILL",
        "imagen": "https://coolboxpe.vtexassets.com/arquivos/ids/177726-800-auto?v=637442542869270000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Marca: SKULLCANDY\n"
            "Tipo:In Ear\n"
            "Micrófono:Sí\n"
            "Conexión Bluetooth:No\n"
            "Inalámbrico:No\n"
            "Cancelación de ruido:No\n"
            "Resistencia al agua:No\n"
            "Controles:Música y llamadas\n"
            "Longitud de cable: 1.2 m\n"

    },
    "Xiaomi Semi":
    {
        "nombre": "Xiaomi Semi",
        "imagen": "https://www.sure.com.bo/wp-content/uploads/2021/07/PR-02483-1.jpg",
        "descripcion":
            "Marca: Xiaomi\n"
            "Modelo: BRE02JY / Dual Drivers In-Ear\n"
            "Colores disponibles: Negro y Blanco\n"
            "Material: TPE\n"
            "Diseño: In-Ear, cable 90º\n"
            "Longitud del cable: 1.2 metros\n"
            "Conexión: USB C\n"
            "Interfaz:  De botones de reproducción\n"
            "Micrófono: con función manos libres\n"
            "Compatible:  con smartphones, consolas, dispositivos de reproducción, ordenadores, etc.\n"
            "Impedancia: 32 ohms\n"
            "Frecuencia: 20 – 40KHz\n"
            "Sensibilidad: 113dB\n"
            "Dimensiones: 12,00 x 3,50 x 2,50 cm\n"
            "Precio: 169 Bs\n"

    },
    "Samsung AKG":
    {
        "nombre": "Samsung AKG",
        "imagen": "https://cdn.shopify.com/s/files/1/0550/3870/5840/products/auriculares-samsung-akg-usb-c-AlCosto-Bolivia_1.jpg?v=1619019841",
        "descripcion":
            "Diseño: Los audífonos AKG T/c cuentan con un diseño compacto y ligero con un cable trenzado, que ayuda a evitar enredos y se ajusta cómodamente a los oídos.\n"
            "Conector: Su conector es de 3.5mm y se conecta directamente al puerto jack de auriculares del dispositivo móvil.\n"
            "Control remoto: Incluyen un control remoto en línea que permite controlar la reproducción de música y la toma de llamadas telefónicas.\n"
            "Micrófono: Incorporan un micrófono integrado con cancelación de ruido ambiental para reducir el ruido exterior y mejorar la calidad de las llamadas telefónicas.\n"
            "Sonido: Los auriculares AKG T/c ofrecen un sonido de alta calidad con una respuesta de frecuencia de 20 Hz a 20 kHz y una impedancia de 32 ohmios.\n"
            "Accesorios: Vienen con tres pares de almohadillas de diferentes tamaños (pequeñas, medianas y grandes) para asegurar el ajuste perfecto en los oídos de cada usuario.\n"
            "Compatibilidad: Los audífonos AKG T/c son compatibles con una amplia variedad de dispositivos móviles y reproductores de audio que tengan un puerto jack de 3.5mm.\n"
            "Conexion: USB C\n"
    }
    
}
#PARLANTES Y MICROFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------
parlantes = {
    "roller":
    {
        "nombre" : "roller",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/210095-800-auto?v=637860883663930000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Bluetooth:Sí \n"
            "Potencia:10W x 2\n"
            "Lector memoria SD:Micro SD/TF\n"
            "Puertos USB:Sí\n"
            "Resistencia al agua y al sudor: certificación IPX4\n"
            "Tiempo de reproducción:apróx. 10 horas ( volumen al 50%)\n"
            "Función True Wireless:Sí\n"
            "Control remoto:No\n"
            "Versión Bluetooth: v5.0\n"

    }

    ,"sensations":
    {
        "nombre" : "sensations",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/213500-800-auto?v=637892573555370000&width=800&height=auto&aspect=true",
        "descripcion": 
            " Bluetooth:Sí \n"
            "	Potencia:100W\n"
            "	Lector memoria SD:Micro SD/TF\n"
            "	Puertos USB:Sí\n"
            "	Control remoto:Sí\n"
            "	Radio FM: Sí\n"
            "	Conexión micrófono: Sí\n"
            "	Conexión auxiliar 3.5 mm: Sí\n"
            
        
    }
        ,"aerial":
    {
        "nombre" : "aerial",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/195397-800-auto?v=637740535136630000&width=800&height=auto&aspect=true",
        "descripcion": 
            " Bluetooth:Sí \n"
            "	Potencia:9.5W\n"
            "	Lector memoria SD:Micro SD/TF\n"
            "	Tiempo de reproducción:1.5h a volumen máximo\n"
            "	Función True Wireless:No\n"
            "	Radio FM: Sí\n"
            "	Control remoto:No\n"
            "	Versión Bluetooth: v5.0\n"
    }

}

microfonos = {
            "Shure":
          {
                "nombre": "Shure",
                "imagen": "https://coolboxpe.vtexassets.com/arquivos/ids/241962-800-auto?v=638065652034730000&width=800&height=auto&aspect=true",
                "descripcion":
                    "Tipo:Dinámico\n"
                    "Formato:para parante (no incluido)\n"
                    "Tipo de conector:XLR y USB\n"
                    "Uso:Alámbrico\n"
                    "Color:Negro\n"
                    "Respuesta en frecuencia:50 Hz a 16 kHz\n"
                    "Tasa de bits:16 / 24 bits\n"

            },
          "NT1-A Rode":{
              "nombre": "NT1-A Rode",
              "imagen": "https://coolboxpe.vtexassets.com/arquivos/ids/249371-800-auto?v=638097333791800000&width=800&height=auto&aspect=true",
              "descripcion":
                "Tipo:De condensador\n"
                "Tipo de conector:XLR\n" 
                "Uso:Alámbrico\n"
                "Conexión:XLR\n"
                "Color:Gris\n"
                "¿Qué incluye en la caja?:Micrófono y accesorio\n"


          },
          "Xlr C1 Behringer":{
              "nombre":"Xlr C1 Behringer",
              "imagen":"https://coolboxpe.vtexassets.com/arquivos/ids/249351-800-auto?v=638097333060700000&width=800&height=auto&aspect=true",
              "descripcion":
                	"Tipo:De condensador\n"
                    "Tipo de conector:XLR\n"
                    "Uso:Alámbrico\n" 
                    "Conexión:XLR\n"
                    "Color:Plateado\n"
                    "¿Qué incluye en la caja?:Micrófono , Soporte de micrófono y estuche Airpods\n"
                }
}



#ARTICULOS DE PC -----------------------------------------------------------------------------------------------------------------------------------------------------------
teclados = {
            "Hyperx Alloy":
          {
                "nombre": "Hyperx Alloy",
                "imagen": "https://coolboxpe.vtexassets.com/arquivos/ids/186570-800-auto?v=637592958952930000&width=800&height=auto&aspect=true",
                "descripcion":
                    "Tipo de teclado: Mecánico\n"
                    "Conectividad: USB Alámbrico\n"
                    "Longitud del cable: 1.8 m\n"
                    "Interfaz: USB\n"
                    "Iluminación: LED RGB\n"
                    "Switch: Sí\n"
                    "Detalle de Switch: Lineal rojo\n"
                    "Anti-ghosting: Sí\n"

            },
          "MX KEYS":{
              "nombre": "MX KEYS",
              "imagen": "https://coolboxpe.vtexassets.com/arquivos/ids/197808-800-auto?v=637776150490400000&width=800&height=auto&aspect=true",
              "descripcion":
                "Tipo de teclado: Membrana\n"
                "Conectividad: USB Inalámbrico\n"
                "Iluminación: Sí\n"
                "Teclado numérico: No\n"
                "Idioma del teclado: Español\n"
                "Color: Grafito\n"
                "Compatibilidad con sistema operativo: Windows, macOS, Linux, Chrome OS, Android, iOS\n"
                "Fuente de alimentación: Recargable\n"


          },
          "G513 Lightsync":{
              "nombre":"G513 Lightsync",
              "imagen":"https://coolboxpe.vtexassets.com/arquivos/ids/181582-800-auto?v=637499084864000000&width=800&height=auto&aspect=true",
              "descripcion":
                	"Tipo de teclado: Mecánico\n"
                    "Conectividad: USB Alámbrico\n"
                    "Longitud del cable: 0.3 metros\n"
                    "Interfaz: USB\n"
                    "Iluminación: Sí\n"
                    "Switch: Sí\n"
                    "Detalle de Switch: Interruptor mecánico GX BLUE con distancia de actuación 1,9 mm, la fuerza de actuación es de 50 g y el recorrido total 4,0 mm\n"
                    "Teclado numérico: Sí\n"

          }
}

mouses = {
    "logitech":
    {
        "nombre" : "logitech",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/186995-800-auto?v=637607711278930000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Color: Negro \n"
            "Conectividad: USB Inalámbrico\n"
            "Detalle de DPI: 16000 dpi\n"
            "Número de botones: 11 botones\n"
            "Iluminación: Sí\n"
            "Interfaz: USB\n"
            "Compatibilidad con sistema operativo: Windows 7 o posteriores, Mac OS X 10.11 o posteriores, Chrome OSTM y puertos USB\n"
            "Velocidad: >400 IPS\n"
            

    }

    ,"ironclaw":
    {
        "nombre" : "ironclaw",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/228194-800-auto?v=637982499634270000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Color: Negro \n"
            "Conectividad: USB Alámbrico\n"
            "Longitud del cable: 1.8 m\n"
            "DPI: 18000 Dpi\n"
            "Número de botones: 7 botones\n"
            "Iluminación: Sí\n"
            "Interfaz: USB\n"
            "Orientación de mano: Diestro\n"
            
        
    }
        ,"teraware":
    {
        "nombre" : "teraware",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/207773-800-auto?v=637831765691030000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Color: Negro y gris\n"
            "Conectividad: USB Alámbrico\n"
            "DPI: 2400 dpi\n"
            "Número de botones: 6 botones\n"
            "Iluminación: Sí\n"
            "Interfaz: USB\n"
            "Compatibilidad con sistema operativo: Windows 7 a superiores\n"          
    }
}

coolers= {
    "deep":
    {
        "nombre" : "deep",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/178831-800-auto?v=637478186687400000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Capacidad máx.: 17\n"
            "Puertos USB: 2\n"
            "Ventiladores: 1\n"
            "Posturas: 5 Niveles de Altura Ajustable\n"
            "Material: Malla Metálica + Plástico\n"
            "Luces: Sí\n"
            "Uso: para Laptop\n"
            "¿Qué incluye la caja?: Cable USB A USB, cooler\n"
            

    }

    ,"emaxx":
    {
        "nombre" : "emaxx",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/198341-800-auto?v=637789871675800000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Capacidad máx.: 15.6\n"
            "Puertos USB: 2\n"
            "Ventiladores: 5\n"
            "Posturas: 5\n"
            "Material: Plástico y malla de hierro\n"
            "Luces: Sí\n"
            "Uso: para Laptop\n"
            "Dimensiones del ventilador: 7 x 7 x 1.5 cm (4 ventiladores)\n"
    }

    ,"skiil":
    {
        "nombre" : "skiil",
        "imagen" : "https://coolboxpe.vtexassets.com/arquivos/ids/164012-800-auto?v=637263930601500000&width=800&height=auto&aspect=true",
        "descripcion": 
            "Capacidad máx.: 17\n"
            "Puertos USB: 2\n"
            "Puertos USB: 2\n"
            "Ventiladores: 5\n"
            "Posturas: 8 diferentes posiciones\n"
            "Material: Malla Metálica + Plástico\n"
            "Luces: Sí\n"
            "Uso: para Laptop\n"
            "¿Qué incluye la caja?: Cable USB A USB, cooler\n"
    }

}



#GENERAR BOTONES
audfonos ={"Inalámbricos":inalambrico,"Cable ":concable,"Orejeras":cascos}
parlants = {"Parlantes": parlantes,"Microfonos":microfonos}
articuloPc ={"Teclado":teclados,"Mouse":mouses,"Cooler para Laptop":microfonos}


productos={
        "Audifonos" : audfonos,
        "Parlantes-Microfonos" :parlants,
        "Articulos de PC":articuloPc,   
}
opciones = {
    "productos":productos ,
    "Atencion al Cliente": atencion
}


#PARA LE CHAT
saludos = ["hola","saludos","buenas","buenos ","dias"]
product = ["productos","tipso de productos","producto","productos"]
atencional = ["atencion al cliente","problemas","atencion al cliente","atencion","reclamos",]

audif = ["audifono","audifonos"]
audiftin = ["inalámbricos","inalambricos","inalambrico","audifono inalambrico"]
audifInF9 = ["true","pro","mi"]
audiftpCasc = ["cascos","orejeras"]
audifCascP = ["pss","jbl","philips"]
audifConCabp = ['cable','con','c']
audifConCab = ['jib','pill','semi','xiaomi','akg']




parlantestecno = ['parlante','parlantes']
parla = ['roller','sensations','aerial']
micus = ['microfonos','microfono']
micmac = ['shure','rode', 'xlr','c1','behringer']


artculopc = ["pc","articulos","artulos para pc"]
tecldo = ["teclados","teclado"]
tecladotip = ["hyperx","mx","lightsync"]
mausestecno = ['mouses', 'mouse','raton','ratones']
mases = ['logitech','ironclaw','teraware']
coolerstecno = ['colers', 'cooler', 'coole', 'collers', 'coolers']
coler = ['deep', 'emaxx', 'skiil']

#CONEXION DE AL BASE DE DATOS CON AL TIENDA TECNO---------------------------------------------------------------------------------------------------
dbaTEcno = ["comprar","adquirir"]

#-----------------------------------------------------------------
#inio con comando
@bot.message_handler(commands=["start"])
def Inicio (message):
    respuesta = "Hola {} \nSoy el Chaat bot de la tienda Tecno".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta) 
    botenesOpciones(message.chat.id)
#inio con comando
@bot.message_handler(commands=["catalogo"])
def Inicio (message):
    compra(message.chat.id)
    #bot.send_message(1542267997,"HOLA PUTO Lo logre :3")
    #respuesta = "Hola {} \nSoy el Cahat bot de la tienda Tecno".format(message.from_user.id)
    #bot.send_message(message.chat.id,respuesta)
    #botenesOpciones(message.chat.id)
    
#-----------------------------------------------------------------
#creaciond e botones

#botones Al iniciar Conversacion
def botenesOpciones(chat_id):
    markup = types.InlineKeyboardMarkup()
    for opcion in opciones:
        button = types.InlineKeyboardButton(opcion,callback_data=opcion)
        markup.add(button)
    respuesta = "En que puedo ayudarte"
    bot.send_message(chat_id,respuesta,reply_markup=markup)

#Crear Botones de tipos de Productos
def tiposProd(chat_id):
    markup = types.InlineKeyboardMarkup()
    for producto in productos:
        button = types.InlineKeyboardButton(producto,callback_data=producto)
        markup.add(button)
        respuesta ="Elije una de nuestras categorías:"
    bot.send_message(chat_id,respuesta,reply_markup=markup)


#AUDIFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------

#crear botonoes de audifonos
def tiposAudifonos(chat_id):
    markup = types.InlineKeyboardMarkup()
    for audiftips in audfonos:
        button = types.InlineKeyboardButton(audiftips,callback_data=audiftips)
        markup.add(button)
        respuesta ="Que tipo de Audífono te interesa?"
    bot.send_message(chat_id,respuesta,reply_markup=markup)

#crear botonos de audifnos inalabbricos
def tiposAudifonosInalambricos(chat_id):
    markup = types.InlineKeyboardMarkup()
    for audiftipsin in inalambrico:
        nombre = inalambrico[audiftipsin]["nombre"]
        imagen_url = inalambrico[audiftipsin]["imagen"]
        bot.send_message(chat_id, nombre)
        bot.send_photo(chat_id, imagen_url)

    
    for audiftipsin in inalambrico:
        button = types.InlineKeyboardButton(audiftipsin,callback_data=audiftipsin)
        markup.add(button)
        respuesta ="De seas información de alguno de nuestros productos?"
    bot.send_message(chat_id,respuesta,reply_markup=markup)

#crear botones para audifonos Con cables
def tiposAudifonosConCable(chat_id):
    markup =  types.InlineKeyboardMarkup()
    for audiftipscas in concable:
        nombre = concable[audiftipscas]["nombre"]
        imagen_url = concable[audiftipscas]["imagen"]
        bot.send_message(chat_id, nombre)
        bot.send_photo(chat_id, imagen_url)

    for audiftipscas in concable:
        button =  types.InlineKeyboardButton(audiftipscas,callback_data=audiftipscas)
        markup.add(button)
        respuesta ="De seas información de alguno de nuestros productos?"
    bot.send_message(chat_id, respuesta,reply_markup=markup)

#crear botones para audifonos Cascos

def tiposAudifonosCascos(chat_id):
    markup =  types.InlineKeyboardMarkup()
    for audiftipscas in cascos:
        nombre = cascos[audiftipscas]["nombre"]
        imagen_url = cascos[audiftipscas]["imagen"]
        bot.send_message(chat_id, nombre)
        bot.send_photo(chat_id, imagen_url)

    for audiftipscas in cascos:
        button =  types.InlineKeyboardButton(audiftipscas,callback_data=audiftipscas)
        markup.add(button)
        respuesta ="De seas información de alguno de nuestros productos?"
    bot.send_message(chat_id, respuesta,reply_markup=markup)

#PARLANTES Y MICROFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------
#creacion de los botones para los parlantes2
#crear botonoes de parlantes
def tiposParlantesMicrof(chat_id):
    markup = types.InlineKeyboardMarkup()
    for parlan in parlants:
        button = types.InlineKeyboardButton(parlan,callback_data=parlan)
        markup.add(button)
        respuesta ="Que tipo de parlante o microfono te interesa?"
    bot.send_message(chat_id,respuesta,reply_markup=markup)


def tiposdeparlantes (chat_id):
    markup = types.InlineKeyboardMarkup()
    for tiposdeparlante in parlantes:
        nombre = parlantes [tiposdeparlante]["nombre"]
        imagen_url = parlantes [tiposdeparlante]["imagen"]
        bot.send_message(chat_id , nombre)
        bot.send_photo(chat_id ,imagen_url)
    
    for tiposdeparlante in parlantes:
        button = types.InlineKeyboardButton(tiposdeparlante, callback_data = tiposdeparlante )
        markup.add (button)
        respuesta = "De seas informacion de alguno de nuestros productos"
    bot.send_message(chat_id, respuesta, reply_markup=markup)

#creacion de los bootnes para microfonos 
def tiposdeMicrofonos(chat_id):
    markup = types.InlineKeyboardMarkup()
    for tiposdecoolers in microfonos:
        nombre = microfonos [tiposdecoolers]["nombre"]
        imagen_url = microfonos [tiposdecoolers]["imagen"]
        bot.send_message(chat_id , nombre)
        bot.send_photo(chat_id ,imagen_url)
    
    for tiposdecllers in microfonos:
        button = types.InlineKeyboardButton(tiposdecllers, callback_data = tiposdecllers )
        markup.add (button)
        respuesta = "De seas informacion de alguno de nuestros productos"
    bot.send_message(chat_id, respuesta, reply_markup=markup)

#ARTICULOS DE PC -----------------------------------------------------------------------------------------------------------------------------------------------------------

#crear botones para Articulso Pc
def tiposArticulosPc(chat_id):
    markup =  types.InlineKeyboardMarkup()
    for artPc in articuloPc:
        button =  types.InlineKeyboardButton(artPc,callback_data=artPc)
        markup.add(button)
        respuesta ="Que peoducto te interesa"
    bot.send_message(chat_id, respuesta,reply_markup=markup)

  #crear botones para Teclados
def tiposTeclados(chat_id):
    markup =  types.InlineKeyboardMarkup()
    for tecla in teclados:
        nombre = teclados[tecla]["nombre"]
        imagen_url = teclados[tecla]["imagen"]
        bot.send_message(chat_id, nombre)
        bot.send_photo(chat_id, imagen_url)

    for tecla in teclados:
        button =  types.InlineKeyboardButton(tecla,callback_data=tecla)
        markup.add(button)
        respuesta ="De seas información de alguno de nuestros productos?"
    bot.send_message(chat_id, respuesta,reply_markup=markup)
#creacion de los botones para mauses

def tiposdemauses(chat_id):
    markup = types.InlineKeyboardMarkup()
    for tiposdemauses in mouses:
        nombre = mouses [tiposdemauses]["nombre"]
        imagen_url = mouses [tiposdemauses]["imagen"]
        bot.send_message(chat_id , nombre)
        bot.send_photo(chat_id ,imagen_url)
    
    for tiposdemauses in mouses:
        button = types.InlineKeyboardButton(tiposdemauses, callback_data = tiposdemauses )
        markup.add (button)
        respuesta = "De seas informacion de alguno de nuestros productos"
    bot.send_message(chat_id, respuesta, reply_markup=markup)

#creacion de los bootnes para coolers 
def tiposdecoolers(chat_id):
    markup = types.InlineKeyboardMarkup()
    for tiposdecoolers in coolers:
        nombre = coolers [tiposdecoolers]["nombre"]
        imagen_url = coolers [tiposdecoolers]["imagen"]
        bot.send_message(chat_id , nombre)
        bot.send_photo(chat_id ,imagen_url)
    
    for tiposdecllers in coolers:
        button = types.InlineKeyboardButton(tiposdecllers, callback_data = tiposdecllers )
        markup.add (button)
        respuesta = "De seas informacion de alguno de nuestros productos"
    bot.send_message(chat_id, respuesta, reply_markup=markup)

#CONEXION DE AL BASE DE DATOS CON AL TIENDA TECNO---------------------------------------------------------------------------------------------------


#creacion de los bootnes para todos los productos
def compra(chat_id):
    botons1 = types.InlineKeyboardMarkup()
    botons2 = types.InlineKeyboardMarkup()
    botons3 = types.InlineKeyboardMarkup()
    botons4 = types.InlineKeyboardMarkup()
    botons5 = types.InlineKeyboardMarkup()
    botons6 = types.InlineKeyboardMarkup()
    botons7 = types.InlineKeyboardMarkup()
    botons8 = types.InlineKeyboardMarkup()
    bot.send_message(chat_id, "ARTICULSO DE PC") 
    for tiposdecllers in coolers:
        button = types.InlineKeyboardButton(tiposdecllers, callback_data = tiposdecllers )
        botons1.add (button)
    bot.send_message(chat_id,"COOLERS",reply_markup=botons1)
    for tiposdemauses in mouses:
        button = types.InlineKeyboardButton(tiposdemauses, callback_data = tiposdemauses )
        botons2.add (button)
    bot.send_message(chat_id, "MOUSE",reply_markup=botons2)
    for tecla in teclados:
        button =  types.InlineKeyboardButton(tecla,callback_data=tecla)
        botons3.add(button)
    bot.send_message(chat_id, "TECLADO",reply_markup=botons3)

    bot.send_message(chat_id, "PARLANTES Y MICROFONOS")
    for tiposdecllers in microfonos:
        button = types.InlineKeyboardButton(tiposdecllers, callback_data = tiposdecllers )
        botons4.add (button)
    bot.send_message(chat_id, "MICROFONOS",reply_markup=botons4)
    for tiposdeparlante in parlantes:
        button = types.InlineKeyboardButton(tiposdeparlante, callback_data = tiposdeparlante )
        botons5.add (button)
    bot.send_message(chat_id, "PARLANTES",reply_markup=botons5)  

    bot.send_message(chat_id, "AUDIFONOS")
    for audiftipscas in cascos:
        button =  types.InlineKeyboardButton(audiftipscas,callback_data=audiftipscas)
        botons6.add(button)
    bot.send_message(chat_id, "Audifonos Tipo Orejeras",reply_markup=botons6)  
    for audiftipsin in inalambrico:
        button = types.InlineKeyboardButton(audiftipsin,callback_data=audiftipsin)
        botons7.add(button)
    bot.send_message(chat_id, "Audifonos Tipo Inalabrico",reply_markup=botons7)  
    for audiftipscas in concable:
        button =  types.InlineKeyboardButton(audiftipscas,callback_data=audiftipscas)
        botons8.add(button)
    bot.send_message(chat_id, "Audifonos con Cable",reply_markup=botons8)  
    bot.send_message(chat_id, "puedes escoger entre estas opciones") 

#-----------------------------------------------------------------
#monejarse por botones
#decir que cosas tiene que mandar cada boton
#la aprte de Opciones al inicio

@bot.callback_query_handler(func=lambda call: call.data in opciones.keys())
def botonesDeOpciones(call):
    opcion = call.data
    atencionAlCliente = opciones[opcion]
    if(opcion == "Atencion al Cliente"):
        respuesta = atencionAlCliente
        bot.send_message(call.message.chat.id, respuesta)
    elif(opcion == "productos"):
        respuesta = "{}".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposProd(call.message.chat.id)  

#la parte de resivir algun tidpo de producto
@bot.callback_query_handler(func=lambda call: call.data in productos.keys())
def botonesDeOpciones(call):
    prod = call.data
    atencionAlCliente = productos[prod]
    if(prod == "Atencion al Cliente"):
        respuesta = atencionAlCliente
        bot.send_message(call.message.chat.id, respuesta)
    elif(prod == "Audifonos"):
        respuesta = "{}".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposAudifonos(call.message.chat.id)

    elif(prod == "Parlantes-Microfonos"):
        respuesta = "{}".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposParlantesMicrof(call.message.chat.id)
    elif(prod == "Articulos de PC"):
        respuesta = "{}".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposArticulosPc(call.message.chat.id)

#AUDIFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------

#Al momento de escoger algun tipo de producto AUDIFONOS
@bot.callback_query_handler(func=lambda call: call.data in audfonos.keys())
def botonesDeOpciones(call):
    audifnIn = call.data
    
    if(audifnIn == "Inalámbricos"):
        respuesta = "{}, estos son nuestros audifonos inalambricos.".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposAudifonosInalambricos(call.message.chat.id)

    elif(audifnIn == "Cable "):
        respuesta = "{}, estos son nuestros audifonos .".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposAudifonosConCable(call.message.chat.id)

    elif(audifnIn == "Orejeras"):
        respuesta = "{},estos son nuestros audifonos Tipo Orejeras".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposAudifonosCascos(call.message.chat.id)

#Al momento de escoger algun tipo AUDIFONOS INALAMBRICO
@bot.callback_query_handler(func=lambda call: call.data in inalambrico.keys())
def botonesDeOpciones(call):
    audifnIn = call.data
    nombre = inalambrico[audifnIn]["nombre"]
    imagen_url = inalambrico[audifnIn]["imagen"]
    detalle = inalambrico[audifnIn]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id, detalle)

#Al momento de escoger algun tipo AUDIFONOS CON CABLE
@bot.callback_query_handler(func=lambda call: call.data in concable.keys())
def botonesdeOpciones(call):
    audifnCasc = call.data
    nombre = concable[audifnCasc]["nombre"]
    imagen_url = concable[audifnCasc]["imagen"]
    detalle = concable[audifnCasc]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id, detalle)


#crearBotoenespara lSo tipos de Audifonso orejeras
@bot.callback_query_handler(func=lambda call: call.data in cascos.keys())
def botonesdeOpciones(call):
    audifnCasc = call.data
    nombre = cascos[audifnCasc]["nombre"]
    imagen_url = cascos[audifnCasc]["imagen"]
    detalle = cascos[audifnCasc]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id,detalle)

#PARLANTES Y MICROFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------
#Al momento de escoger algun tipo de producto parlante
@bot.callback_query_handler(func=lambda call: call.data in parlants.keys())
def botonesDeOpciones(call):
    parlormic = call.data
    
    if(parlormic == "Parlantes"):
        respuesta = "{}, estos son nuestros parlantes.".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposdeparlantes(call.message.chat.id)

    elif(parlormic == "Microfonos"):
        respuesta = "{}, estos son nuestros microfonos.".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposdeMicrofonos(call.message.chat.id)

#aplicacion de botones para los parlantes 
@bot.callback_query_handler(func=lambda call: call.data in parlantes.keys())
def botonesdeOpciones(call):
    parlantees = call.data
    nombre = parlantes[parlantees]["nombre"]
    imagen_url = parlantes[parlantees]["imagen"]
    detalle = parlantes[parlantees]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id,detalle)

#aplicaicones de botones para microfonos

@bot.callback_query_handler(func=lambda call: call.data in microfonos.keys())
def botonesdeOpmau(call):
    tiposdemic = call.data
    nombre = microfonos[tiposdemic]["nombre"]
    imagen_url = microfonos[tiposdemic]["imagen"]
    detalle = microfonos [tiposdemic]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id,detalle)

#ARTICULOS DE PC -----------------------------------------------------------------------------------------------------------------------------------------------------------

#Al momento de escoger algun tipo de producto ARticulsoPC
@bot.callback_query_handler(func=lambda call: call.data in articuloPc.keys())
def botonesDeOpciones(call):
    audifnIn = call.data
    if(audifnIn == "Teclado"):
        respuesta = "{}, estos son nuestros teclados.".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposTeclados(call.message.chat.id)

    elif(audifnIn == "Mouse"):
        respuesta = "{}, estos son nuestros Mouse .".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposdemauses(call.message.chat.id)
        
    elif(audifnIn == "Cooler para Laptop"):
        respuesta = "{},estos son nuestros colers".format(call.from_user.first_name)
        bot.send_message(call.message.chat.id, respuesta)
        tiposdecoolers(call.message.chat.id)

#crearBotoenespara lSo tipos de Teclados
@bot.callback_query_handler(func=lambda call: call.data in teclados.keys())
def botonesdeTeclados(call):
    teclad = call.data
    nombre = teclados[teclad]["nombre"]
    imagen_url = teclados[teclad]["imagen"]
    detalle = teclados[teclad]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id,detalle)

#aplicacion de botones para mouses 

@bot.callback_query_handler(func=lambda call: call.data in mouses.keys())
def botonesdeOpmau(call):
    tiposdemauses = call.data
    nombre = mouses[tiposdemauses]["nombre"]
    imagen_url = mouses[tiposdemauses]["imagen"]
    detalle = mouses [tiposdemauses]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id,detalle)

#aplicaicones de botones para coolers 

@bot.callback_query_handler(func=lambda call: call.data in coolers.keys())
def botonesdeOpmau(call):
    tiposdecoolers = call.data
    nombre = coolers[tiposdecoolers]["nombre"]
    imagen_url = coolers[tiposdecoolers]["imagen"]
    detalle = coolers [tiposdecoolers]["descripcion"]
    bot.send_message(call.message.chat.id, nombre)
    bot.send_photo(call.message.chat.id, imagen_url)
    bot.send_message(call.message.chat.id,detalle)

#-----------------------------------------------------------------------------------------------------------------------------------------------
#hablar por mensajes
#Hablar por mensaje saludo

@bot.message_handler(func=lambda message: any(token.lower() in saludos for token in word_tokenize(message.text.lower())))
def Saludo(message):        
    respuesta = "Hola {} \nSoy el Cahat bot de la tienda Tecno".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    botenesOpciones(message.chat.id)

#Hablar pro mendaje Producto
@bot.message_handler(func=lambda message: any(token.lower() in product for token in word_tokenize(message.text.lower())))
def Producto(message):
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposProd(message.chat.id)  

#Hablar por mensaje atencion al cliente
@bot.message_handler(func=lambda message: any(token.lower() in atencional for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    global atencion
    respuesta = atencion
    bot.send_message(message.chat.id,respuesta)

#AUDIFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------

#Hablar por mensaje cuando esocge Audifono
@bot.message_handler(func=lambda message: any(token.lower() in audif for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
   
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposAudifonos(message.chat.id)
#Hablar por mensaje cuando escoja audifnos inalambriicos
@bot.message_handler(func=lambda message: any(token.lower() in audiftin for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    respuesta = "{}, estos son nuestros audifonos inalambricos.".format(message.from_user.first_name)
    bot.send_message(message.chat.id, respuesta)
    tiposAudifonosInalambricos(message.chat.id)

#Hablar por mensaje cuando escoja un audifono inalambrico
@bot.message_handler(func=lambda message: any(token.lower() in audifInF9 for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in inalambrico): 
        nombre = inalambrico[mensajeRecuperado]["nombre"]
        imagen_url = inalambrico[mensajeRecuperado]["imagen"]
        detalle = inalambrico[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
       respuesta = "Lo siento no te entendi"
       bot.send_message(message.chat.id, respuesta) 


#Hablar por mensaje cuando escoja audifnos tipo cable
@bot.message_handler(func=lambda message: any(token.lower() in audifConCabp for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    respuesta = "{}, estos son nuestros audifonos Con cable.".format(message.from_user.first_name)
    bot.send_message(message.chat.id, respuesta)
    tiposAudifonosConCable(message.chat.id)


#Hablar por mensaje cuando escoja un audifono tipo cable
@bot.message_handler(func=lambda message: any(tokens.lower() in audifConCab for tokens in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in concable):
        nombre = concable[mensajeRecuperado]["nombre"]
        imagen_url = concable[mensajeRecuperado]["imagen"]
        detalle = concable[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
        respuesta = "Lo siento no te entendi"
        bot.send_message(message.chat.id, respuesta)  


#Hablar por mensaje cuando escoja audifnos tipo orejeras
@bot.message_handler(func=lambda message: any(token.lower() in audiftpCasc for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    respuesta = "{}, estos son nuestros audifonos Tipo Orejeras.".format(message.from_user.first_name)
    bot.send_message(message.chat.id, respuesta)
    tiposAudifonosCascos(message.chat.id)


#Hablar por mensaje cuando escoja un audifono tipo orejera
@bot.message_handler(func=lambda message: any(tokens.lower() in audifCascP for tokens in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in cascos): 
        nombre = cascos[mensajeRecuperado]["nombre"]
        imagen_url = cascos[mensajeRecuperado]["imagen"]
        detalle = cascos[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
       respuesta = "Lo siento no te entendi"
       bot.send_message(message.chat.id, respuesta) 

#PARLANTES Y MICROFONOS-----------------------------------------------------------------------------------------------------------------------------------------------------------
#hablado de por mensaje de parlantes

#Hablar por mensaje cuando esocge Parlante
@bot.message_handler(func=lambda message: any(token.lower() in parlantestecno for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
   
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposdeparlantes(message.chat.id)
#hablado de por mensaje cuadno escoja un microfono
@bot.message_handler(func=lambda message: any(token.lower() in parla for token in word_tokenize(message.text.lower())))
def parlantees(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in parlantes): 
        nombre = parlantes[mensajeRecuperado]["nombre"]
        imagen_url = parlantes[mensajeRecuperado]["imagen"]
        detalle = parlantes[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
       respuesta = "Ingrese El nombre Del producto De manera adecuada o el producto que ingreso no existe"
       bot.send_message(message.chat.id,respuesta)
#hablado de por mensaje cuadno escoja microfonos

@bot.message_handler(func=lambda message: any(token.lower() in micus for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposdeMicrofonos(message.chat.id)

#hablado de por mensaje cuadno escoja un microfono

@bot.message_handler(func=lambda message: any(token.lower() in micmac for token in word_tokenize(message.text.lower())))
def mausess(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in microfonos): 
        nombre = microfonos[mensajeRecuperado]["nombre"]
        imagen_url = microfonos[mensajeRecuperado]["imagen"]
        detalle = microfonos[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
       respuesta = "Ingrese El nombre Del producto De manera adecuada o el producto que ingreso no existe"
       bot.send_message(message.chat.id, respuesta) 





#ARTICULOS DE PC -----------------------------------------------------------------------------------------------------------------------------------------------------------

#Hablar por mensaje cuando esocge ArticulsoPc
@bot.message_handler(func=lambda message: any(token.lower() in artculopc for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
   
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposArticulosPc(message.chat.id)


#Hablar por mensaje cuando escoja teclado
@bot.message_handler(func=lambda message: any(token.lower() in tecldo for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposTeclados(message.chat.id)

#Hablar por mensaje cuando escoja un teclado 
@bot.message_handler(func=lambda message: any(token.lower() in tecladotip for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in teclados): 
        nombre = teclados[mensajeRecuperado]["nombre"]
        imagen_url = teclados[mensajeRecuperado]["imagen"]
        detalle = teclados[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
       respuesta = "Lo siento no te entendi"
       bot.send_message(message.chat.id, respuesta) 

#Hablar por mensaje cuando escoja mouse
@bot.message_handler(func=lambda message: any(token.lower() in mausestecno for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposdemauses(message.chat.id)

#hablado por mensajhe cuandoi escoja un mouse

@bot.message_handler(func=lambda message: any(token.lower() in mases for token in word_tokenize(message.text.lower())))
def mausess(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in mouses): 
        nombre = mouses[mensajeRecuperado]["nombre"]
        imagen_url = mouses[mensajeRecuperado]["imagen"]
        detalle = mouses[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
       respuesta = "Ingrese El nombre Del producto De manera adecuada o el producto que ingreso no existe"
       bot.send_message(message.chat.id,respuesta)
#Hablar por mensaje cuando escoja coolers
@bot.message_handler(func=lambda message: any(token.lower() in coolerstecno for token in word_tokenize(message.text.lower())))
def AtencionAlCliente(message):
    respuesta = "{}".format(message.from_user.first_name)
    bot.send_message(message.chat.id,respuesta)
    tiposdecoolers(message.chat.id)

#hablado de por mensaje cuando escoja un cooler
@bot.message_handler(func=lambda message: any(token.lower() in coler for token in word_tokenize(message.text.lower())))
def mausess(message):
    mensajeRecuperado = message.text
    if(mensajeRecuperado in coolers): 
        nombre = coolers[mensajeRecuperado]["nombre"]
        imagen_url = coolers[mensajeRecuperado]["imagen"]
        detalle = coolers[mensajeRecuperado]["descripcion"]
        bot.send_message(message.chat.id, nombre)
        bot.send_photo(message.chat.id, imagen_url)
        bot.send_message(message.chat.id, detalle)
    else:
       respuesta = "Ingrese El nombre Del producto De manera adecuada o el producto que ingreso no existe"
       bot.send_message(message.chat.id, respuesta) 




   
if __name__ == "__main__":
    print("Bot iniciado")
    bot.infinity_polling()
