package com.akkademy

import akka.actor.{Actor, Status}
import com.akkademy.messages.{Ping}

class PingActor extends Actor {
  override def receive: Receive = {
    case Ping() => sender() ! "Pong"
    case _ => sender() ! Status.Failure(new Exception("unknown message"))
  }
}
