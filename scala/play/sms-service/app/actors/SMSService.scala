package actors

import java.net.InetSocketAddress
import javax.inject.Inject

import akka.actor.{Actor, ActorLogging, Props}
import akka.io.Tcp._
import akka.io.{IO, Tcp}
import com.google.inject.AbstractModule
import play.api.libs.concurrent.AkkaGuiceSupport

class SMSService @Inject() extends Actor with ActorLogging {
  import context.system

  IO(Tcp) ! Bind(self, new InetSocketAddress("localhost", 6666))

  def receive = {
    case Bound(localAddress) =>
      log.info("SMS server listening on {}", localAddress)

    case CommandFailed(_: Bind) => context stop self

    case Connected(remote, local) =>
      val connection = sender()
      val handler = context.actorOf(Props(classOf[SMSHandler], connection))
      connection ! Register(handler)
  }
}

class SMSServiceModule extends AbstractModule with AkkaGuiceSupport {
  def configure(): Unit = bindActor[SMSService]("sms")
}
