package actors

import akka.actor.{ActorRef, ActorLogging, Actor}
import akka.io.Tcp._

class SMSHandler(connection: ActorRef) extends Actor with ActorLogging {
  def receive = {
    case Received(data) =>
      log.info("Received message: {}", data.utf8String)
      connection ! Write(data)

    case PeerClosed => context stop self
  }
}
