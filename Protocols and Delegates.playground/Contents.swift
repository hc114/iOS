import Foundation
//Protocols and Delegates
//List of methods that specify a contract or interface
@objc protocol Speaker{
    func Speak();
    optional func TellJoke();
}

//Any class that conforms to this method must follow all the methods that are in here
//put a colon after the class name and write the protocol
//Optional Protocol: If you want to have a protocol with optional methods you must prefix the protocol with the @objc. Then you prefix any methods that can be optional with the @objc tag

class Michael: Speaker{
    @objc func Speak() {
        print("hmm");
    }
    @objc func TellJoke() {
        print("A chicken crosses the road...");
    }
}

class Joseph: Speaker{
    @objc func Speak(){
        print("no");
    }
    @objc func TellJoke() {
        print("Hello");
    }
}

class Animal{
    
}
class Dog:Animal,Speaker{
    @objc func Speak(){
        print("bark")
    }
}

//Using Protocols
var speaker:Speaker
speaker=Michael();
speaker.Speak()
var roommate:Speaker
roommate=Joseph();
//The question mark at the end checks if the method exists before executing it (Optional Chaining)
roommate.TellJoke?();

//Delegates A delegate is a variable that conforms to a protocol, which a class typically uses to notify of events or perform of sub-tasks


//Notify another class when the Date begins or ends. First create a protocol of events that you want to notify
protocol DateSimulatorDelegate{
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker)
}

class LoggingDateSimulator:DateSimulatorDelegate{
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker, b: Speaker) {
        print("Date Started");
    }
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker, b: Speaker) {
        print("Date Ended");
    }
    
}


class DateSimulator{
    
    //add a new property to DateSimulator that conforms to the delegate
    var delegate:DateSimulatorDelegate?;
    let a: Speaker
    let b: Speaker
    
    init(a:Speaker, b:Speaker){
        self.a=a
        self.b=b
    }
    
    func simulate(){
        delegate?.dateSimulatorDidStart(self, a: a, b: b)
        print("Off to dinner")
        a.Speak()
        b.Speak()
        print("Walking back home")
        a.TellJoke!()
        b.TellJoke!()
        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
    }
}

let sim=DateSimulator(a:Michael(), b:Joseph())
sim.delegate=LoggingDateSimulator();
sim.simulate()



