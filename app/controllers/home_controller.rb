class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    @post = Post.new
    @post.date = params[:date]
    @post.title = params[:title]
    @post.content = params[:content]
    @post.user_id = current_user.id
    
    results1 = ['동국대', '덕성여대', '아주대', '성결대', '강원대', '경기대', '한국외대', '서울시립대', '국민대', '성신여대', '남서울대', '성공회대']
    results2 = ['소주', '맥주', '소맥', '막걸리', '맛있는술(ex.복소사)', '복분자주', '칵테일', '양주', '소맥']
    @result1 = results1.sample(1)
    @result2 = results2.sample(1)
    if @result2 == results2[0]
      results3 = ['곱창, 막창', '삼겹살', '회', '족발', '소고기 무한리필', '연어']
      @result3 = results3.sample(1)
      
    elsif @result2 == results2[1]
      results3 = ['치킨', '피자', '마른안주', '회', '불닭, 불족발', '치막피', '소고기 무한리필', '수제버거', '연어', '육회']
     @result3 = results3.sample(1)
     
    elsif @result2 == results2[2]
      results3 = ['치킨', '피자', '마른안주', '회', '불닭, 불족발', '치막피', '소고기 무한리필', '수제버거', '연어', '육회']
      @result3 = results3.sample(1)
      
    elsif @result2 == results2[3]
      results3 = ['파전', '삼합', '족발']
      @result3 = results3.sample(1)
      
    elsif @result2 == results2[4]
      results3 = ['연어', '육회', '수제버거']
      @result3 = results3.sample(1)
      
    elsif @result2 == results2[5]
      results3 = ['떡볶이', '파전']
      @result3 = results3.sample(1)
      
    elsif @result2 == results2[6]
      results3 = ['치즈', '감자튀김']
      @result3 = results3.sample(1)
    
    elsif @result2 == results2[7]
      results3 = ['치즈', '회']
      @result3 = results3.sample(1)
      
    else
      results3 = ['치킨', '피자', '마른안주', '회', '불닭, 불족발', '치막피', '소고기 무한리필', '수제버거', '연어', '육회']
      @result3 = results3.sample(1)
    end
    
    results4 = ['장성원', '김승래', '신민정', '황진선', '최승호']
    @result4 = results4.sample(1)
    
    results5 = ['노래방 가즈아!', '보드게임 가즈아!', '방탈출 가즈아!', '인생네컷 가즈아!', '볼링장 가즈아!', '포켓볼 가즈아!']
    @result5 = results5.sample(1)
    
    @post.result1 = @result1.first
    @post.result2 = @result2.first
    @post.result3 = @result3.first
    @post.result4 = @result4.first
    @post.result5 = @result5.first
    @post.save
    
    redirect_to "/home/show/#{@post.id}"
    
    # if @post.save
    #   redirect_to root_path
    # else
    #   redirect_to @post_path
    # end
  end

  def show
    @post = Post.find(params[:id])
    @post.view_count = @post.view_count + 1
    @post.save
    @allpost = Post.all
  end
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.user.id != current_user.id
    redirect_to "/home/calender" 
    
    else
    @post.date = params[:date]
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to "/home/calender"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.user.id != current_user.id
      redirect_to "/home/calender"
      # redirect_to "/home/index"
    else
      @post.destroy
      redirect_to "/home/calender"
    end
  end
  
  def calender
    @posts = Post.all
  end
  
  def intro
    # @post = Post.find(params[:id])
    @user = current_user
  end
  
  def pIntro
    @post = Post.find(params[:id])
  end
end