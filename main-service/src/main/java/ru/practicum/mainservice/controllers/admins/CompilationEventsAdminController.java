package ru.practicum.mainservice.controllers.admins;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import ru.practicum.mainservice.dto.compilation.CompilationDto;
import ru.practicum.mainservice.dto.compilation.NewCompilationDto;
import ru.practicum.mainservice.dto.compilation.UpdateCompilationRequest;
import ru.practicum.mainservice.services.CompilationService;

import javax.validation.Valid;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/compilations")
public class CompilationEventsAdminController {

    private final CompilationService compilationService;

    @PostMapping
    CompilationDto addNewCompilations(@RequestBody @Valid NewCompilationDto newCompilationDto) {

        log.info("Добавление новой подборки");
        return compilationService.addNewCompilations(newCompilationDto);
    }

    @DeleteMapping("/{compId}")
    void deleteUser(@PathVariable Integer compId) {
        log.info("Удаление подборки");
        compilationService.deleteUser(compId);
    }

    @PatchMapping("/{compId}")
    CompilationDto updateCompilation(@PathVariable Integer compId,
                                     @RequestBody @Valid UpdateCompilationRequest updateCompilationRequest) {
        log.info("Обновить информацию о подборке");
        return compilationService.updateCompilation(compId, updateCompilationRequest);
    }

}
