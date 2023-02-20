OscOut oout;
1979 => int port;
oout.dest("localhost", port);

while (true) {
    oout.start("/chuckie/osctest");    
    Math.random2(48,80) => int note;
    Math.random2f(0.1,1.0) => float velocity;
    "Oh, Happy day!" => string message;
    note => oout.add;
    velocity => oout.add;
    message => oout.add;
    oout.send();
    second => now;
}