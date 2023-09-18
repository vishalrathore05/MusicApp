class MusicsController < ApplicationController
    def index
      @musics = Music.all
    end

    def new
        @musics = Music.new
    end
    def create
        @music = Music.new(music_params)

        if @music.save
            redirect_to musics_path, notice: 'Music create successfully.'
        else
            render :new
        end
    end

    def home
      @musics = Music.all.order(:id)  # Assuming you have a way to order tracks

      # Determine the currently playing track based on a parameter or session variable
      current_track_id = params[:current_track_id] || session[:current_track_id]

      if current_track_id.present?
        # Find the index of the current track in the list
        current_track_index = @musics.pluck(:id).index(current_track_id.to_i)

        if current_track_index.present?
          # Calculate the ID of the next track
          next_track_index = (current_track_index + 1) % @musics.length
          next_track_id = @musics[next_track_index].id

          # Set the session variable for the next track
          session[:current_track_id] = next_track_id
        else
          # Handle the case where the current track is not found
          # You can redirect or display an error message
        end
      end

      # Render the home view
    end



    def lets_go
    end

    private

    def music_params
        params.require(:music).permit(:name, :thumbnail, :audio)
    end
  end
