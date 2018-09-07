package com.auth.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Table(name = "role")
@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Role {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_STORE_ROLES")
    @SequenceGenerator(
            name = "SEQ_STORE_ROLES",
            sequenceName = "role_id_seq",
            initialValue = 5,
            allocationSize = 1
    )
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;
}
