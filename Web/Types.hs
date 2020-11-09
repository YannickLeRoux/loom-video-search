module Web.Types where

import Application.Helper.Controller
import Generated.Types
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import IHP.Prelude
import IHP.ViewSupport

data WebApplication = WebApplication deriving (Eq, Show)

data ViewContext = ViewContext
  { requestContext :: ControllerSupport.RequestContext,
    flashMessages :: [IHP.Controller.Session.FlashMessage],
    controllerContext :: ControllerSupport.ControllerContext,
    layout :: Layout
  }

data StaticController = WelcomeAction deriving (Eq, Show, Data)

data LoomVideosController
  = LoomVideosAction
  | SearchLoomVideosAction
  | NewLoomVideoAction
  | ShowLoomVideoAction {loomVideoId :: !(Id LoomVideo)}
  | CreateLoomVideoAction
  | EditLoomVideoAction {loomVideoId :: !(Id LoomVideo)}
  | UpdateLoomVideoAction {loomVideoId :: !(Id LoomVideo)}
  | DeleteLoomVideoAction {loomVideoId :: !(Id LoomVideo)}
  deriving (Eq, Show, Data)
