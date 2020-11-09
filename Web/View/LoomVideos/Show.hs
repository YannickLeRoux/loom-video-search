module Web.View.LoomVideos.Show where

import Web.View.Prelude

data ShowView = ShowView {loomVideo :: LoomVideo}

instance View ShowView ViewContext where
  html ShowView {..} =
    [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LoomVideosAction}>LoomVideos</a></li>
                <li class="breadcrumb-item active">Show LoomVideo</li>
            </ol>
        </nav>
        <h1>{get #title loomVideo}</h1>
        <a href={get #link loomVideo}>Link</a>
    |]
