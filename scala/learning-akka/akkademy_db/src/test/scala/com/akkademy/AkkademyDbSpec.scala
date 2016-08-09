package com.akkademy

import org.scalatest.{BeforeAndAfterEach, FunSpecLike, Matchers}
import akka.actor.ActorSystem
import com.akkademy.messages.SetRequest
import akka.testkit.TestActorRef
import akka.util.Timeout
import scala.concurrent.duration._

class AkkademyDbSpec extends FunSpecLike with Matchers with BeforeAndAfterEach {
  implicit val system = ActorSystem()
  implicit val timeout = Timeout(5 seconds)

  describe("akkademyDb") {
    describe("given SetRequest") {
      it("should place key/value into map"){
        val actorRef = TestActorRef(new AkkademyDb)
        actorRef ! SetRequest("key", "value")

        val akkademyDb = actorRef.underlyingActor
        akkademyDb.map.get("key") should equal(Some("value"))
      }
    }
  }
}
