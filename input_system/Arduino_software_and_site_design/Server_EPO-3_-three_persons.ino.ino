#include <ESP8266WiFi.h>
//IP adress is 192.168.4.1

const char *ssid = "DeSnelsteBijVanNederland";
const char *password = "ZoemVroem";   //Dat kan alleen maar een bij zijn
const int max_connect = 3;            //Max 3 people can be connected at once
String webString;

WiFiServer server(80);                //Initialize the server on port 80 [default port]

const int Pac_led_0 = D0;             //Define set of pins [used for outputs]
const int Pac_led_1 = D1;
const int Pac_led_2 = D2;
const int Ghost1_led_0 = D3; 
const int Ghost1_led_1 = D4;
const int Ghost1_led_2 = D5;
const int Ghost2_led_0 = D6;
const int Ghost2_led_1 = D7;
const int Ghost2_led_2 = D8;

void setup()
{
  WiFi.mode(WIFI_AP);                         //We configure the ESP to be an acces point
  WiFi.softAP(ssid, password, 1, false, max_connect); 
  server.begin();                             //Start the server

  Serial.begin(115200);                       //Now we can look at the Serial Monitor...
  IPAddress HTTPS_ServerIP= WiFi.softAPIP();  //...Which will show...
  Serial.print("Server IP is:\n ");           //...The IP of our server!
  Serial.println(HTTPS_ServerIP);             //(if the monitor is conf. as baud 115200)

  pinMode(Pac_led_2, OUTPUT);                  //Initial state is logic '000'
  digitalWrite(Pac_led_2, 0);                
  pinMode(Pac_led_1, OUTPUT); 
  digitalWrite(Pac_led_1, 0);                 
  pinMode(Pac_led_0, OUTPUT); 
  digitalWrite(Pac_led_0, 0);     

  pinMode(Ghost1_led_2, OUTPUT);              //Initial state is logic '000'
  digitalWrite(Ghost1_led_2, 0);                 
  pinMode(Ghost1_led_1, OUTPUT); 
  digitalWrite(Ghost1_led_1, 0);                 
  pinMode(Ghost1_led_0, OUTPUT); 
  digitalWrite(Ghost1_led_0, 0);

  pinMode(Ghost2_led_2, OUTPUT);              //Initial state is logic '000'
  digitalWrite(Ghost2_led_2, 0);                 
  pinMode(Ghost2_led_1, OUTPUT); 
  digitalWrite(Ghost2_led_1, 0);                 
  pinMode(Ghost2_led_0, OUTPUT); 
  digitalWrite(Ghost2_led_0, 0);
}

void loop()
{
  WiFiClient client = server.available(); 
    if (!client) { 
      return;                                 //Keep restarting loop from here until a client has connected
    } 
    Serial.println("Somebody has connected!");

    String request = client.readStringUntil('\r');     //Vraag data van client
    Serial.println(request);

    if (request.indexOf("/Start") != -1){     //Use received data to determine which state to go to
      digitalWrite(Pac_led_2, HIGH);          //From led 2 to 0:
      digitalWrite(Pac_led_1, HIGH);          //Start: 111
      digitalWrite(Pac_led_0, HIGH);          //Right: 001, Up: 010, Left: 011, Down: 100 
    }
    else if (request.indexOf("/Reset") != -1){ 
      digitalWrite(Pac_led_2, LOW); 
      digitalWrite(Pac_led_1, LOW);
      digitalWrite(Pac_led_0, LOW);
      digitalWrite(Ghost1_led_2, LOW); 
      digitalWrite(Ghost1_led_1, LOW);
      digitalWrite(Ghost1_led_0, LOW);
      digitalWrite(Ghost2_led_2, LOW); 
      digitalWrite(Ghost2_led_1, LOW);
      digitalWrite(Ghost2_led_0, LOW);
    }
    else if (request.indexOf("/Right") != -1){ 
      digitalWrite(Pac_led_2, LOW); 
      digitalWrite(Pac_led_1, LOW);
      digitalWrite(Pac_led_0, HIGH);
    }
    else if (request.indexOf("/Up") != -1){ 
      digitalWrite(Pac_led_2, LOW); 
      digitalWrite(Pac_led_1, HIGH);
      digitalWrite(Pac_led_0, LOW);
    }
    else if (request.indexOf("/Left") != -1){ 
      digitalWrite(Pac_led_2, LOW); 
      digitalWrite(Pac_led_1, HIGH);
      digitalWrite(Pac_led_0, HIGH);
    }
    else if (request.indexOf("/Down") != -1){ 
      digitalWrite(Pac_led_2, HIGH); 
      digitalWrite(Pac_led_1, LOW);
      digitalWrite(Pac_led_0, LOW);
    }
    
    if (request.indexOf("/G1Right") != -1){  //Ghost 1 start checking browser
      digitalWrite(Ghost1_led_2, LOW); 
      digitalWrite(Ghost1_led_1, LOW);
      digitalWrite(Ghost1_led_0, HIGH);
    }
    else if (request.indexOf("/G1Up") != -1){ 
      digitalWrite(Ghost1_led_2, LOW); 
      digitalWrite(Ghost1_led_1, HIGH);
      digitalWrite(Ghost1_led_0, LOW);
    }
    else if (request.indexOf("/G1Left") != -1){ 
      digitalWrite(Ghost1_led_2, LOW); 
      digitalWrite(Ghost1_led_1, HIGH);
      digitalWrite(Ghost1_led_0, HIGH);
    }
    else if (request.indexOf("/G1Down") != -1){ 
      digitalWrite(Ghost1_led_2, HIGH); 
      digitalWrite(Ghost1_led_1, LOW);
      digitalWrite(Ghost1_led_0, LOW);
    }
    
    if (request.indexOf("/G2Right") != -1){  //Ghost 2 start checking browser
      digitalWrite(Ghost2_led_2, LOW); 
      digitalWrite(Ghost2_led_1, LOW);
      digitalWrite(Ghost2_led_0, HIGH);
    }
    else if (request.indexOf("/G2Up") != -1){ 
      digitalWrite(Ghost2_led_2, LOW); 
      digitalWrite(Ghost2_led_1, HIGH);
      digitalWrite(Ghost2_led_0, LOW);
    }
    else if (request.indexOf("/G2Left") != -1){ 
      digitalWrite(Ghost2_led_2, LOW); 
      digitalWrite(Ghost2_led_1, HIGH);
      digitalWrite(Ghost2_led_0, HIGH);
    }
    else if (request.indexOf("/G2Down") != -1){ 
      digitalWrite(Ghost2_led_2, HIGH); 
      digitalWrite(Ghost2_led_1, LOW);
      digitalWrite(Ghost2_led_0, LOW);
    }
    
    String HTML = "HTTP/1.1 200 OK\r\n";     //Note that HTML is the string name, and thus can be changed
           HTML += "Content-Type: text/html\r\n\r\n";
           HTML += "<br><input type=\"button\" value=\"Start\" onclick=\"location.href='/Start'\">";
           //HTML += "<br><br><br>" //The Br's can be uncommented if used in browser instead of app
           HTML += "<br><input type=\"button\" value=\"P Up\" onclick=\"location.href='/Up'\">";
           //HTML += "<br><br><br>"  
           HTML += "<br><input type=\"button\" value=\"P Down\" onclick=\"location.href='/Down'\">";
           //HTML += "<br><br><br>"   
           HTML += "<br><input type=\"button\" value=\"P Left\" onclick=\"location.href='/Left'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"P Right\" onclick=\"location.href='/Right'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G1 Up\" onclick=\"location.href='/G1Up'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G1 Down\" onclick=\"location.href='/G1Down'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G1 Left\" onclick=\"location.href='/G1Left'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G1 Right\" onclick=\"location.href='/G1Right'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G2 Up\" onclick=\"location.href='/G2Up'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G2 Down\" onclick=\"location.href='/G2Down'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G2 Left\" onclick=\"location.href='/G2Left'\">";
           //HTML += "<br><br><br>"
           HTML += "<br><input type=\"button\" value=\"G2 Right\" onclick=\"location.href='/G2Right'\">";
           //HTML += "<br><br><br>"
           HTML += "</html>\n";
    
    client.flush();       //clear previous info in the stream 
    client.print(HTML);   // Send the response to the client 
    delay(1); 
    Serial.println("Client disconnected"); 
}
