package com.akkademy

import akka.actor.{ActorSystem, Props}
import akka.pattern.ask
import akka.testkit.{ImplicitSender, TestKit}
import akka.util.Timeout
import com.akkademy.messages.{Ping, Pong}
import org.scalatest.{BeforeAndAfterAll, FunSpecLike, Matchers}

import scala.concurrent.Await
import scala.concurrent.duration._

class PingPongSpec extends TestKit(ActorSystem("MySpec"))
  with ImplicitSender with FunSpecLike with Matchers with BeforeAndAfterAll
{
  override def afterAll {
    TestKit.shutdownActorSystem(system)
  }

  describe("Ping Actor") {
    val pingActor = system.actorOf(Props.create(classOf[PingActor]))
    implicit val timeout = Timeout(5 seconds)

    it("Returns a Pong when it receives a Ping") {
      val future = pingActor ? Ping()
      val result = Await.result(future.mapTo[String], 1 second)
      assert(result == "Pong")
    }

    it("should fail on unknown message") {
      val future = pingActor ? "unknown"
      intercept[Exception] {
        Await.result(future.mapTo[String], 1 second)
      }
    }
  }
}
