package ru.practicum;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

import static ru.practicum.dto.Constants.DATE_TIME_PATTERN;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EndpointHitDto {
    @NotBlank(message = "Идентификатор сервиса не может быть пустым или неопределенным")
    private String app;
    @NotBlank(message = "URI не может быть пустым или неопределенным")
    private String uri;
    @NotBlank(message = "IP-адрес пользователя не может быть пустым или неопределенным")
    private String ip;
    @NotNull
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = DATE_TIME_PATTERN)
    private LocalDateTime timestamp;
}