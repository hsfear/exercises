package com.akkademy

import akka.actor.{ActorSystem, Props}
import akka.pattern.ask
import akka.testkit.{ImplicitSender, TestKit}
import akka.util.Timeout
import com.akkademy.messages.Ping
import org.scalatest.{BeforeAndAfterAll, FunSpecLike, Matchers}

import scala.concurrent.{Await, Future}
import scala.concurrent.duration._
import scala.concurrent.ExecutionContext.Implicits.global

class PingPongSpec extends TestKit(ActorSystem("MySpec"))
with ImplicitSender with FunSpecLike with Matchers with BeforeAndAfterAll
{
  override def afterAll {
    TestKit.shutdownActorSystem(system)
  }

  describe("Ping Actor") {
    val pingActor = system.actorOf(Props.create(classOf[PingActor]))
    implicit val timeout = Timeout(5 seconds)
    def askPing(): Future[String] = (pingActor ? Ping()).mapTo[String]

    it("Returns a Pong when it receives a Ping") {
      val result = Await.result(askPing(), 1 second)
      assert(result == "Pong")
    }

    it("should fail on unknown message") {
      val future = (pingActor ? "unknown").recover({
        case e: Exception => e.getMessage
      })
      val completed = Await.result(future, 1 second)
      assert(completed == "unknown message")
    }

    it("should print to console"){
      askPing().onSuccess({
        case x: String => println("replied with: " + x)
      })
      Thread.sleep(100)
    }

    it("should print the first letter to console"){
      askPing().map(_.charAt(0)).onSuccess({
        case x: Char => println("replied with: " + x)
      })
      Thread.sleep(100)
    }

    it("should work in a for comprehension") {
      for{
        x <- askPing()
        y <- askPing()
      } println("replied with " + x + y)
      Thread.sleep(100)
    }

    it("should work with a list of futures") {
      val listOfFutures = List(askPing(), askPing(), askPing())
      val futures = Future.sequence(listOfFutures)
      val result = Await.result(futures, 1 second) .mkString("")
      assert(result == "PongPongPong")
    }
  }
}
