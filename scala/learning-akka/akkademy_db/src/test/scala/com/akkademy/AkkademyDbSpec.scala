package com.akkademy

import akka.actor.ActorSystem
import akka.pattern.ask
import akka.testkit.{TestActorRef, TestKit}
import akka.util.Timeout
import com.akkademy.messages.{GetRequest, KeyNotFoundException, SetIfNotExists, SetRequest}
import org.scalatest._

import scala.concurrent.Await
import scala.concurrent.duration._

class AkkademyDbSpec extends FunSpecLike with Matchers with BeforeAndAfterAll {
  implicit val system = ActorSystem()
  implicit val timeout = Timeout(5 seconds)

  override def afterAll {
    TestKit.shutdownActorSystem(system)
  }

  describe("akkademyDb") {
    describe("GetRequest") {
      it("should return the value that was set for the key") {
        val actorRef = TestActorRef(new AkkademyDb)
        actorRef ! SetRequest("key", "value")
        val futureResult = (actorRef ? GetRequest("key")).mapTo[String]
        val value = Await.result(futureResult, 10 seconds)
        value should equal("value")
      }

      it("should throw an exception if the key has not been set"){
        val actorRef = TestActorRef(new AkkademyDb)
        intercept[KeyNotFoundException] {
          val futureResult = (actorRef ? GetRequest("key")).mapTo[String]
          Await.result(futureResult, 10 seconds)
        }
      }
    }

    describe("SetRequest") {
      it("should place key/value into map"){
        val actorRef = TestActorRef(new AkkademyDb)
        actorRef ! SetRequest("key", "value")

        val akkademyDb = actorRef.underlyingActor
        akkademyDb.map.get("key") should equal(Some("value"))
      }
    }

    describe("SetIfNotExists") {
      it("should place the key/value into the map if the key does not already exist") {
        val actorRef = TestActorRef(new AkkademyDb)
        actorRef ! SetIfNotExists("key", "value")

        val akkademyDb = actorRef.underlyingActor
        akkademyDb.map.get("key") should equal(Some("value"))
      }
      it("should not update the key/value if the key already exists") {
        val actorRef = TestActorRef(new AkkademyDb)
        actorRef ! SetIfNotExists("key", "value")
        actorRef ! SetIfNotExists("key", "new value")

        val akkademyDb = actorRef.underlyingActor
        akkademyDb.map.get("key") should equal(Some("value"))
      }
    }
  }
}
