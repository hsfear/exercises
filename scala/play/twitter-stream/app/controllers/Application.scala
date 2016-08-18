package controllers

import actors.TwitterStreamer
import play.api.Play.current
import play.api._
import play.api.libs.json.JsValue
import play.api.libs.oauth.{ConsumerKey, RequestToken}
import play.api.mvc._

class Application extends Controller {
  val credentials: Option[(ConsumerKey, RequestToken)] = for {
    apiKey <- Play.configuration.getString("twitter.apiKey")
    apiSecret <- Play.configuration.getString("twitter.apiSecret")
    token <- Play.configuration.getString("twitter.token")
    tokenSecret <- Play.configuration.getString("twitter.tokenSecret")
  } yield (ConsumerKey(apiKey, apiSecret), RequestToken(token, tokenSecret))

  def index = Action { implicit request =>
    Ok(views.html.index("Tweets"))
  }

//  def tweets = Action.async {
//    credentials.map {
//      case (consumerKey, requestToken) =>
//        val (iteratee, enumerator) = Concurrent.joined[Array[Byte]]
//
//        val jsonStream: Enumerator[JsObject] =
//          enumerator &>
//            Encoding.decode() &>
//            Enumeratee.grouped(JsonIteratees.jsSimpleObject)
//
//        val loggingIteratee = Iteratee.foreach[JsObject] { value =>
//          Logger.info(value.toString())
//        }
//
//        jsonStream run loggingIteratee
//
//        WS
//          .url("https://stream.twitter.com/1.1/statuses/filter.json")
//          .sign(OAuthCalculator(consumerKey, requestToken))
//          .withQueryString("track" -> "scala")
//          .get { response =>
//            Logger.info("Status: " + response.status)
//            iteratee
//          }
//          .map { _ =>
//            Ok("Stream closed")
//          }
//    } getOrElse {
//        Future.successful(InternalServerError("Bad twitter credentials"))
//    }
//  }

  def tweets = WebSocket.acceptWithActor[String, JsValue] { request => out =>
    TwitterStreamer.props(out)
  }

  def replicateFeed = Action { implicit request =>
    Ok.feed(TwitterStreamer.subscribeNode)
  }
}
