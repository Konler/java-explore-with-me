package ru.practicum.mainservice.dto.compilation;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.validator.constraints.UniqueElements;
import org.springframework.beans.factory.annotation.Value;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Getter
@Setter
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewCompilationDto {
    @Builder.Default
    List<Integer> events=List.of();
    @Builder.Default
    Boolean pinned=false;

    @NotBlank
    @Size(min = 1, max = 50, message = "Длина заголовка подборки должна быть от 1 до 50")
    String title;
}