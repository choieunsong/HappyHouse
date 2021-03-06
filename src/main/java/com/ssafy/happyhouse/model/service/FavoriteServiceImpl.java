package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dto.Favorite;
import com.ssafy.happyhouse.model.mapper.FavoriteDAO;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	public FavoriteDAO dao;
	
	@Override
	@Transactional
	public boolean addFavorite(Favorite fav) {
		return dao.addFavorite(fav) == 1;
	}

	@Override
	@Transactional
	public boolean removeFavorite(int no) {
		return dao.removeFavorite(no) == 1;
	}

	@Override
	@Transactional
	public List<Favorite> getFavorite(int userno) {
		return dao.getFavorite(userno);
	}
	
	@Override
	@Transactional
	public List<Favorite> getFavoriteAptInfo(int userno){
		return dao.getFavoriteAptInfo(userno);
	}
}
