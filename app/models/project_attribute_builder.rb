class ProjectAttributeBuilder < ApplicationRecord
  attr_reader :project

  attr_accessor
    :audio_codec_params
    :offset_params
    :audio_overlay_video

  def initialize(project)
    @project = project

    build
  end

  def transformations

      {audio_codec: audio_codec_params, end_offset: offset_params, quality:"auto", crop:"scale"}
      {}

  end

  private

  def build
    projects_with_audio if @project.audio_id?
    if @project.background_id?
      projects_with_background
    else
      projects_without_background
    end
  end

  def projects_with_audio
    self.audio_codec_params = "none"
    self.offset_params = "2"
    self.audio_overlay_video = {angle: @project.video.rotation,flags:"splice", overlay:"video:"+Rails.env+":"+@project.video.file.key, start_offset:offset_params},
      {:flags=>"layer_apply", :start_offset=>"2"}
    self.audio_overlay = {overlay: "video:"+Rails.env+":"+@project.audio.file.key}
  end

  def projects_with_background
    self.text_box_width = @project.background.width
    self.text_box_height = @project.background.text_box_height
    self.text_box_x = @project.background.x_axis
    self.text_box_y = @project.background.y_axis
    self.project_angle = @project.background.angle
    self.underlay_params = { underlay: "#{Rails.env}:#{@project.background.photo.key}", width: 1280, crop: "scale" },
                          { effect: "fade:1" }



  end

  def projects_without_background
    self.text_box_width = @project.video.text_width
    self.text_box_height = @project.video.text_box_height
    self.text_box_x = @project.video.x_axis
    self.text_box_y = @project.video.y_axis
    self.project_angle = @project.video.angle
    self.underlay_params = nil
  end
end
