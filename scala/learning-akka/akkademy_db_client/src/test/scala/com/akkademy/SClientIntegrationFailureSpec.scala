package com.akkademy

import akka.pattern.AskTimeoutException
import org.scalatest.{FunSpecLike, Matchers}

import scala.concurrent.Await
import scala.concurrent.duration._
import scala.language.postfixOps

class SClientIntegrationFailureSpec extends FunSpecLike with Matchers {
  describe("akkademyDbClient failures") {
    it("should fail if given an invalid remote address") {
      val badclient = new SClient("127.0.0.2:2552")
      intercept[AskTimeoutException] {
        badclient.set("123", new Integer(123))
        Await.result(badclient.get("123"), 10 seconds)
      }
    }
  }
}


