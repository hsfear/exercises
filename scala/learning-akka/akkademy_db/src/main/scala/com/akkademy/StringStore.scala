package com.akkademy

import akka.actor.Actor
import com.akkademy.messages.Store

class StringStore extends Actor {
  private [akkademy] var s: Option[String] = None
  override def receive: Receive = {
    case Store(s) => {
      this.s = Some(s)
    }
  }
}
