module Web.View.LoomVideos.Index where

import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.View.Prelude

data IndexView = IndexView {loomVideos :: [LoomVideo]}

instance View IndexView ViewContext where
  html IndexView {..} =
    [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={LoomVideosAction}>LoomVideos</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewLoomVideoAction} class="btn btn-primary ml-4">+ New</a></h1>
        <form method="POST" action={SearchLoomVideosAction}>
            <input type="search" name="video-search" />
            <button type="submit">Search</button>
        </form>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>LoomVideo</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach loomVideos renderLoomVideo}</tbody>
            </table>
        </div>
    |]

renderLoomVideo loomVideo =
  [hsx|
    <tr>
        <td><h1>{get #title loomVideo}</h1></td>
         <td><a href={get #link loomVideo}> Link to the video</a></td>
        <td><a href={EditLoomVideoAction (get #id loomVideo)} class="text-muted">Edit</a></td>
        <td><a href={DeleteLoomVideoAction (get #id loomVideo)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]