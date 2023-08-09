package ru.practicum.mainservice.dto.event;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Data;
import ru.practicum.mainservice.dto.category.CategoryDto;
import ru.practicum.mainservice.dto.user.UserShortDto;
import ru.practicum.mainservice.enums.StateOfEvent;
import ru.practicum.mainservice.model.Location;

import java.time.LocalDateTime;

@Builder
@Data
public class EventFullDto {
    Integer id;
    String annotation;
    CategoryDto category;
    Integer confirmedRequests;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime createdOn;
    String description;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime eventDate;
    UserShortDto initiator;
    Location location;
    Boolean paid;
    Integer participantLimit;

    String publishedOn;
    Boolean requestModeration;
    StateOfEvent state;
    String title;
    Integer views;

}
