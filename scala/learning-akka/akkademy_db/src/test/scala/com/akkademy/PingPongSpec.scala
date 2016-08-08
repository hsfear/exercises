package com.akkademy

import akka.actor.{ActorSystem, Props}
import akka.testkit.{ImplicitSender, TestKit}
import com.akkademy.messages.{Ping, Pong}
import org.scalatest.{BeforeAndAfterAll, FunSpecLike, Matchers}

class PingPongSpec extends TestKit(ActorSystem("MySpec"))
  with ImplicitSender with FunSpecLike with Matchers with BeforeAndAfterAll
{
  override def afterAll {
    TestKit.shutdownActorSystem(system)
  }

  describe("Ping Actor") {
    it("Returns a Pong when it receives a Ping") {
      val pingActor = system.actorOf(Props.create(classOf[PingActor]))
      pingActor ! Ping()
      expectMsg(Pong())
    }
  }
}
