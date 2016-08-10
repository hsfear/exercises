package com.akkademy

import akka.actor.ActorSystem
import akka.pattern.ask
import akka.testkit.{TestActorRef, TestKit}
import akka.util.Timeout
import com.akkademy.messages._
import org.scalatest._

import scala.concurrent.Await
import scala.concurrent.duration._

class AkkademyDbSpec extends FunSpecLike with Matchers with OneInstancePerTest with BeforeAndAfterAll {
  implicit val system = AkkademyDbSpec.system
  implicit val timeout = Timeout(5 seconds)

  override def afterAll {
    TestKit.shutdownActorSystem(AkkademyDbSpec.system)
  }

  val actorRef = TestActorRef(new AkkademyDb)
  val akkademyDb = actorRef.underlyingActor

  describe("akkademyDb") {
    describe("GetRequest") {
      it("should return the value that was set for the key") {
        actorRef ! SetRequest("key", "value")
        val futureResult = (actorRef ? GetRequest("key")).mapTo[String]
        val value = Await.result(futureResult, 10 seconds)
        value should equal("value")
      }

      it("should throw an exception if the key has not been set"){
        intercept[KeyNotFoundException] {
          val futureResult = (actorRef ? GetRequest("key")).mapTo[String]
          Await.result(futureResult, 10 seconds)
        }
      }
    }

    describe("SetRequest") {
      it("should place key/value into map"){
        actorRef ! SetRequest("key", "value")
        akkademyDb.map.get("key") should equal(Some("value"))
      }
    }

    describe("SetIfNotExists") {
      it("should place the key/value into the map if the key does not already exist") {
        actorRef ! SetIfNotExists("key", "value")
        akkademyDb.map.get("key") should equal(Some("value"))
      }

      it("should not update the key/value if the key already exists") {
        actorRef ! SetIfNotExists("key", "value")
        actorRef ! SetIfNotExists("key", "new value")
        akkademyDb.map.get("key") should equal(Some("value"))
      }
    }

    describe("Delete") {
      it("should delete the key/value if it exists") {
        actorRef ! SetRequest("key", "value")
        actorRef ! Delete("key")
        akkademyDb.map.get("key") should equal(None)
      }

      it("should succeed even it the key/value doesn't exists") {
        actorRef ! Delete("key")
        akkademyDb.map.get("key") should equal(None)
      }
    }
  }
}

object AkkademyDbSpec {
  val system = ActorSystem()
}
