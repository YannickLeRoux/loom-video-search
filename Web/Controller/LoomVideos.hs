module Web.Controller.LoomVideos where

import Web.Controller.Prelude
import Web.View.LoomVideos.Edit (EditView (EditView, loomVideo))
import Web.View.LoomVideos.Index
import Web.View.LoomVideos.New
import Web.View.LoomVideos.Show (ShowView (ShowView, loomVideo))

instance Controller LoomVideosController where
  action LoomVideosAction = do
    loomVideos <- query @LoomVideo |> orderByDesc #createdat |> fetch
    render IndexView {..}
  action SearchLoomVideosAction = do
    let search = param @Text "video-search" |> toLower
    if (search == "") then redirectTo LoomVideosAction else return ()
    loomVideos <- query @LoomVideo |> filterWhereIn (#title, [toLower search]) |> orderByDesc #createdat |> fetch
    render IndexView {..}
  action NewLoomVideoAction = do
    let loomVideo = newRecord
    render NewView {..}
  action ShowLoomVideoAction {loomVideoId} = do
    loomVideo <- fetch loomVideoId
    render ShowView {..}
  action EditLoomVideoAction {loomVideoId} = do
    loomVideo <- fetch loomVideoId
    render EditView {..}
  action UpdateLoomVideoAction {loomVideoId} = do
    loomVideo <- fetch loomVideoId
    loomVideo
      |> buildLoomVideo
      |> ifValid \case
        Left loomVideo -> render EditView {..}
        Right loomVideo -> do
          loomVideo <- loomVideo |> updateRecord
          setSuccessMessage "LoomVideo updated"
          redirectTo EditLoomVideoAction {..}
  action CreateLoomVideoAction = do
    let loomVideo = newRecord @LoomVideo
    loomVideo
      |> buildLoomVideo
      |> ifValid \case
        Left loomVideo -> render NewView {..}
        Right loomVideo -> do
          loomVideo <- loomVideo |> createRecord
          setSuccessMessage "LoomVideo created"
          redirectTo LoomVideosAction
  action DeleteLoomVideoAction {loomVideoId} = do
    loomVideo <- fetch loomVideoId
    deleteRecord loomVideo
    setSuccessMessage "LoomVideo deleted"
    redirectTo LoomVideosAction

buildLoomVideo loomVideo =
  loomVideo
    |> fill @["title", "description", "link"]
