package com.akkademy

import org.scalatest.{BeforeAndAfterEach, FunSpecLike, Matchers}
import akka.actor.ActorSystem
import com.akkademy.messages.Store
import akka.testkit.TestActorRef

class StringStoreSpec extends FunSpecLike with Matchers with BeforeAndAfterEach {
  implicit val system = ActorSystem()
  describe("akkademyDb") {
    describe("given SetString") {
      it("should store the last strig set") {
        val actorRef = TestActorRef(new StringStore)
        val stringStore = actorRef.underlyingActor
        actorRef ! Store("Hello, world")
        stringStore.s should equal(Some("Hello, world"))
        actorRef ! Store("Hello, cruel cruel world")
        stringStore.s should equal(Some("Hello, cruel cruel world"))
      }
    }
  }
}
