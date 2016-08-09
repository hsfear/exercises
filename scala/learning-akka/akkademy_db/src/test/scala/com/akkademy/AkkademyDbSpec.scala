package com.akkademy

import org.scalatest._
import akka.actor.ActorSystem
import com.akkademy.messages.{SetIfNotExists, SetRequest}
import akka.testkit.{ImplicitSender, TestActorRef, TestKit}
import akka.util.Timeout

import scala.concurrent.duration._

class AkkademyDbSpec(_system: ActorSystem) extends TestKit(_system)
  with FunSpecLike with Matchers with BeforeAndAfterAll with ImplicitSender {

  def this() = this(ActorSystem("AkkademyDbSpec"))

  override def afterAll {
    TestKit.shutdownActorSystem(system)
  }

  describe("akkademyDb") {
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
