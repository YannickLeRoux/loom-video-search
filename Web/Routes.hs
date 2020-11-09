module Web.Routes where

import Generated.Types
import IHP.RouterPrelude
import Web.Types

-- Generator Marker
instance AutoRoute StaticController

instance AutoRoute LoomVideosController

type instance ModelControllerMap WebApplication LoomVideo = LoomVideosController
