package com.akkademy

import akka.actor.{Actor, ActorSystem, Props, Status}
import akka.event.Logging

import scala.collection.mutable.HashMap
import com.akkademy.messages.{GetRequest, KeyNotFoundException, SetIfNotExists, SetRequest}
class AkkademyDb extends Actor {
  val map = new HashMap[String, Object]
  val log = Logging(context.system, this)

  override def receive = {
    case SetRequest(key, value) =>
      log.info("received SetRequest - key: {} value: {}", key, value)
      map.put(key, value)
      sender() ! Status.Success

    case SetIfNotExists(key, value) =>
      log.info("received SetIfNotExists - key: {} value: {}", key, value)
      map.put(key, map.getOrElse(key, value))
      sender() ! Status.Success

    case GetRequest(key) =>
      log.info("received GetRequest - key: {}", key)
      val response: Option[Object] = map.get(key)
      response match {
        case Some(x) => sender() ! x
        case None => sender() ! Status.Failure(new KeyNotFoundException(key))
      }

    case o => Status.Failure(new ClassNotFoundException)
  }
}

object Main extends App {
  val system = ActorSystem("akkademy")
  val helloActor = system.actorOf(Props[AkkademyDb], name = "akkademy-db")
}
