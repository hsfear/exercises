package com.akkademy.messages

case class Delete(key: String)
case class GetRequest(key: String)
case class SetRequest(key: String, value: Object)
case class SetIfNotExists(key: String, value: Object)

case class KeyNotFoundException(key: String) extends Exception

case class Store(s: String)
case class Ping()
