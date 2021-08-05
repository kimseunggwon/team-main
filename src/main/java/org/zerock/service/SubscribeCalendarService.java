package org.zerock.service;

import java.util.List;

import org.zerock.domain.SubscribeDate;

public interface SubscribeCalendarService {
	List<Integer> getSubscribeDate(SubscribeDate subscribeDate);
}
